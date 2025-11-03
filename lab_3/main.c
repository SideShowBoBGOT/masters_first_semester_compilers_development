#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#include <stdint.h>
#endif
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdbool.h>
#include <limits.h>
#include <regex.h>
#include <time.h>
#define STRINGIFY(...) #__VA_ARGS__

#define ARRAY_COUNT(arr) (sizeof((arr)) / sizeof((arr)[0]))
#define ASSERT(expr) \
    do {\
        if(!(expr)) {\
            fprintf(stderr, "%s:%d: %s: Assertion `%s' failed\n", __FILE__, __LINE__, __FUNCTION__, #expr);\
            abort();\
        }\
    } while(0)

#define ASSERT_EXT(expr, ...) \
    do {\
        if(!(expr)) {\
            fprintf(stderr, "%s:%d: %s: Assertion `%s' failed", __FILE__, __LINE__, __FUNCTION__, #expr);\
            __VA_OPT__(fprintf(stderr, " explanation: " __VA_ARGS__);)\
            fprintf(stderr, "\n");\
            abort();\
        }\
    } while(0)

#define ASSERT_NOT_MINUS_ONE(expr) \
    do {\
        if((expr) == -1) {\
            fprintf(stderr, "%s:%d: %s: errno: %d: strerror: %s: Assertion `%s' failed\n", __FILE__, __LINE__, __FUNCTION__, errno, strerror(errno), #expr);\
            abort();\
        }\
    } while(0)

#define ASSERT_NOT_MINUS_ONE_EXT(expr, ...) \
    do {\
        if((expr) == -1) {\
            fprintf(stderr, "%s:%d: %s: errno: %d: strerror: %s: Assertion `%s' failed", __FILE__, __LINE__, __FUNCTION__, errno, strerror(errno), #expr);\
            __VA_OPT__(fprintf(stderr, " explanation: " __VA_ARGS__);)\
            fprintf(stderr, "\n");\
            abort();\
        }\
    } while(0)

#define LOG_DEBUG(...) \
    do {\
        fprintf(stderr, "[%s:%d] [%s] [%ld] ", __FILE__, __LINE__, __FUNCTION__, time(NULL));\
        fprintf(stderr, "[" __VA_ARGS__);\
        fprintf(stderr, "]\n");\
    } while(0)


#define IF(cond) IF_ ## cond
#define IF_0(t, f) f
#define IF_1(t, f) t
#define IF_ELSE(condition) IF_ELSE_ ## condition
#define IF_ELSE_1(...) __VA_ARGS__ IF_ELSE_1_ELSE
#define IF_ELSE_0(...)             IF_ELSE_0_ELSE
#define IF_ELSE_1_ELSE(...)
#define IF_ELSE_0_ELSE(...) __VA_ARGS__


#define TOKENS_MAP \
    X(LPAREN, "[(]")\
    X(RPAREN, "[)]")\
    X(KEYWORD_FN, "fn")\
    X(KEYWORD_IF, "if")\
    X(KEYWORD_WHILE, "while")\
    X(KEYWORD_SET, "set")\
    X(KEYWORD_RETURN, "return")\
    X(TYPE_INT, "int")\
    X(TYPE_FLOAT, "float")\
    X(TYPE_STRING, "string")\
    X(TYPE_BOOL, "bool")\
    X(IDENTIFIER, "[a-zA-Z!$%&*/:<=>?^_~][a-zA-Z!$%&*/:<=>?^_~0-9]*|[+]|[-]")\
    X(BOOLEAN, "true|false")\
    X(INTEGER, "[+-]?[0-9]+")\
    X(FLOAT, "[+-]?[0-9]+[.][0-9]+")\
    X(STRING, "\"[^\"]*\"")\
    X(NEWLINE, "\n")\
    X(WHITESPACE, "[ \t]+")

typedef enum {
    #define X(name, regex) TOKEN_TYPE_ ## name,
        TOKENS_MAP
    #undef X
} TokenType;

static const char* token_regex_map[] = {
    #define X(name, regex) [TOKEN_TYPE_ ## name] = regex,
        TOKENS_MAP
    #undef X
};

static const char* token_type_str(const TokenType type) {
    switch(type) {
        #define X(name, regex) case TOKEN_TYPE_ ## name: return STRINGIFY(TOKEN_TYPE_ ## name);
            TOKENS_MAP
        #undef X
        default: {
            ASSERT(false);
        }
    }
}

typedef struct {
    regoff_t start;
    regoff_t end;
} StringRange;

typedef struct {
    StringRange string_range;
    TokenType type;
} Token;

#define LOG_DEBUG_TOKEN_NAME(lexic_analyzer, token) LOG_DEBUG("%.*s, %s", (token).string_range.end - (token).string_range.start, (lexic_analyzer).str + (token).string_range.start, token_type_str((token).type))

typedef struct {
    regex_t regex;
    regoff_t offset;
    regoff_t newline_index;
    regoff_t newline_offset;
    const char* str;
} LexicAnalyzer;

static void lexic_analyzer_reset(LexicAnalyzer lexic_analyzer[static 1]) {
    lexic_analyzer->newline_index = 0;
    lexic_analyzer->newline_offset = 0;
    lexic_analyzer->offset = 0;
}

static void lexic_analyzer_init(LexicAnalyzer lexic_analyzer[static 1], const char str[]) {
    *lexic_analyzer = (LexicAnalyzer){.str = str};
    lexic_analyzer_reset(lexic_analyzer);
    {
        size_t regex_string_len = 0;
        regex_string_len += ARRAY_COUNT(token_regex_map) - 1;
        regex_string_len += ARRAY_COUNT(token_regex_map) * 2;
        for(uint8_t i = 0; i < ARRAY_COUNT(token_regex_map); ++i) {
            regex_string_len += strlen(token_regex_map[i]);
        }
        regex_string_len += 3;
        char *const regex_string = (char*)malloc(regex_string_len + 1);
        regex_string[0] = '\0';
        strcat(regex_string, "^(");
            strcat(regex_string, "(");
                strcat(regex_string, token_regex_map[0]);
            strcat(regex_string, ")");
            for(uint8_t i = 1; i < ARRAY_COUNT(token_regex_map); ++i) {
                strcat(regex_string, "|");
                strcat(regex_string, "(");
                    strcat(regex_string, token_regex_map[i]);
                strcat(regex_string, ")");
            }
        strcat(regex_string, ")");
        LOG_DEBUG("%s", regex_string);
        ASSERT(regcomp(&lexic_analyzer->regex, regex_string, REG_EXTENDED) == 0);
        free(regex_string);
    }
}

static void lexic_analyzer_deinit(LexicAnalyzer lexic_analyzer[static 1]) {
    regfree(&lexic_analyzer->regex);
}

static bool lexic_analyzer_yield(LexicAnalyzer lexic_analyzer[static 1], Token token[static 1]) {
    #ifdef GROUP_OFFSET
        #error
    #endif
    #define GROUP_OFFSET 2
    regmatch_t regmatch[ARRAY_COUNT(token_regex_map) + GROUP_OFFSET] = {0};
    if(regexec(&lexic_analyzer->regex, lexic_analyzer->str + lexic_analyzer->offset, ARRAY_COUNT(regmatch), regmatch, 0) != REG_NOMATCH) {
        // for debug puposes i want to be sure that token matches only for a single group
        bool group_found = false;
        for(uint8_t i = GROUP_OFFSET; i < (uint8_t)ARRAY_COUNT(regmatch); ++i) {
            if(regmatch[i].rm_so != -1 && regmatch[i].rm_eo != -1) {
                const TokenType token_type = (TokenType)(i - GROUP_OFFSET);
                if(token_type == TOKEN_TYPE_NEWLINE) {
                    lexic_analyzer->newline_index += 1;
                    lexic_analyzer->newline_offset = lexic_analyzer->offset;
                }
                ASSERT(group_found == false);
                group_found = true;
                token->type = token_type;
                token->string_range.start = lexic_analyzer->offset + regmatch[0].rm_so;
                token->string_range.end = lexic_analyzer->offset + regmatch[0].rm_eo;
            }
        }
        // LOG_DEBUG_TOKEN_NAME(*lexic_analyzer, *token);
        // LOG_DEBUG("%s", lexic_analyzer->str + lexic_analyzer->offset);
        lexic_analyzer->offset += regmatch[0].rm_eo;
        return true;
    }
    ASSERT_EXT(lexic_analyzer->offset == (regoff_t)strlen(lexic_analyzer->str), "unrecognized input at %d:%d", lexic_analyzer->newline_index, lexic_analyzer->offset - lexic_analyzer->newline_offset);
    return false;
    #undef GROUP_OFFSET
}

static bool lexic_analyzer_yield_no_whitespace(LexicAnalyzer lexic_analyzer[static 1], Token token[static 1]) {
    while(lexic_analyzer_yield(lexic_analyzer, token)) {
        if(token->type != TOKEN_TYPE_NEWLINE && token->type != TOKEN_TYPE_WHITESPACE) {
            return true;
        }
    }
    return false;
}

#define ASSERT_TOKEN(lexic_analyzer, token, ...)\
    do {\
        const TokenType _valid_token_types[] = {__VA_ARGS__};\
        bool _found = false;\
        for(uint8_t _i = 0; _i < ARRAY_COUNT(_valid_token_types); ++_i) { _found |= (token)->type == _valid_token_types[_i]; }\
        ASSERT_EXT(_found, "Expected tokens `" STRINGIFY(__VA_ARGS__) "', but got: %s. Position %d:%d", token_type_str((token)->type), lexic_analyzer->newline_index, lexic_analyzer->offset - lexic_analyzer->newline_offset);\
    } while(0)

typedef enum {
    SYNTAX_FUNCTION_DEFINITION_PARAMETER_TYPE_BOOL,
    SYNTAX_FUNCTION_DEFINITION_PARAMETER_TYPE_INT,
    SYNTAX_FUNCTION_DEFINITION_PARAMETER_TYPE_FLOAT,
    SYNTAX_FUNCTION_DEFINITION_PARAMETER_TYPE_STRING,
} SyntaxFunctionDefinitionParameterType;

static SyntaxFunctionDefinitionParameterType syntax_function_definition_parameter_type_from_token_type(const TokenType type) {
    switch(type) {
        case TOKEN_TYPE_TYPE_BOOL: return SYNTAX_FUNCTION_DEFINITION_PARAMETER_TYPE_BOOL;
        case TOKEN_TYPE_TYPE_INT: return SYNTAX_FUNCTION_DEFINITION_PARAMETER_TYPE_INT;
        case TOKEN_TYPE_TYPE_FLOAT: return SYNTAX_FUNCTION_DEFINITION_PARAMETER_TYPE_FLOAT;
        case TOKEN_TYPE_TYPE_STRING: return SYNTAX_FUNCTION_DEFINITION_PARAMETER_TYPE_STRING;
        default: ASSERT(false);
    }
}

typedef enum {
    SYNTAX_FUNCTION_CALL_PARAMETER_TYPE_IDENTIFIER,
    SYNTAX_FUNCTION_CALL_PARAMETER_TYPE_BOOLEAN,
    SYNTAX_FUNCTION_CALL_PARAMETER_TYPE_INTEGER,
    SYNTAX_FUNCTION_CALL_PARAMETER_TYPE_FLOAT,
    SYNTAX_FUNCTION_CALL_PARAMETER_TYPE_STRING,
    SYNTAX_FUNCTION_CALL_PARAMETER_TYPE_FUNCTION_CALL,
} SyntaxFunctionCallParameterType;

typedef enum {
    SYNTAX_STATEMENT_TYPE_IF,
    SYNTAX_STATEMENT_TYPE_WHILE,
    SYNTAX_STATEMENT_TYPE_SET,
    SYNTAX_STATEMENT_TYPE_RETURN,
    SYNTAX_STATEMENT_TYPE_FUNCTION_CALL,
} SyntaxStatementType;

#define SYNTAX_CALLBACK_FUNCTIONS\
    X(function_definition_begin, const StringRange name[static 1])\
    X(function_definition_parameter_list_begin)\
    X(function_definition_parameter_list_end)\
    X(function_definition_parameter_name, const StringRange string_range[static 1])\
    X(function_definition_parameter_type, const SyntaxFunctionDefinitionParameterType type)\
    X(statement_list_begin)\
    X(statement_list_end)\
    X(statement, const SyntaxStatementType type)\
    X(function_call_parameter_indentifier, const StringRange string_range[static 1])\
    X(function_call_parameter_bool, const StringRange string_range[static 1])\
    X(function_call_parameter_int, const StringRange string_range[static 1])\
    X(function_call_parameter_float, const StringRange string_range[static 1])\
    X(function_call_parameter_string, const StringRange name[static 1])\
    X(function_call_parameter_function_call)\
    X(function_call_begin, const StringRange name[static 1])\
    X(if_begin)\
    X(while_begin)\
    X(set_begin)\
    X(return_begin)\

typedef struct {
#define X(name, ...) void(*name)(void *const context __VA_OPT__(,) __VA_ARGS__);
    SYNTAX_CALLBACK_FUNCTIONS
#undef X
} SyntaxCallbackFunctions;

static void syntax_function_call_with_name_yielded(LexicAnalyzer lexic_analyzer[static 1], Token token[static 1], const SyntaxCallbackFunctions syntax_callback_functions[static 1], void *const syntax_callback_context);

static bool syntax_function_call_argument(LexicAnalyzer lexic_analyzer[static 1], Token token[static 1], const bool assert_on_rparen, const SyntaxCallbackFunctions syntax_callback_functions[static 1], void *const syntax_callback_context) {
    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
    switch(token->type) {
        case TOKEN_TYPE_IDENTIFIER: {
            syntax_callback_functions->function_call_parameter_indentifier(syntax_callback_context, &token->string_range);
            break;
        }
        case TOKEN_TYPE_BOOLEAN: {
            syntax_callback_functions->function_call_parameter_bool(syntax_callback_context, &token->string_range);
            break;
        }
        case TOKEN_TYPE_INTEGER: {
            syntax_callback_functions->function_call_parameter_int(syntax_callback_context, &token->string_range);
            break;
        }
        case TOKEN_TYPE_FLOAT: {
            syntax_callback_functions->function_call_parameter_float(syntax_callback_context, &token->string_range);
            break;
        }
        case TOKEN_TYPE_STRING: {
            syntax_callback_functions->function_call_parameter_string(syntax_callback_context, &token->string_range);
            break;
        }
        case TOKEN_TYPE_LPAREN: {
            syntax_callback_functions->function_call_parameter_function_call(syntax_callback_context);
            syntax_function_call_with_name_yielded(lexic_analyzer, token, syntax_callback_functions, syntax_callback_context);
            break;
        }
        case TOKEN_TYPE_RPAREN: {
            if(assert_on_rparen) {
                ASSERT(false);
            }
            return false;
        }
        default: {
            ASSERT(false);
        }
    }
    return true;
}

static void syntax_function_call_arguments(LexicAnalyzer lexic_analyzer[static 1], Token token[static 1], const SyntaxCallbackFunctions syntax_callback_functions[static 1], void *const syntax_callback_context) {
    while(syntax_function_call_argument(lexic_analyzer, token, false, syntax_callback_functions, syntax_callback_context)) {}
}

static void syntax_function_call_with_name_yielded(LexicAnalyzer lexic_analyzer[static 1], Token token[static 1], const SyntaxCallbackFunctions syntax_callback_functions[static 1], void *const syntax_callback_context) {
    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_IDENTIFIER);
    syntax_callback_functions->function_call_begin(syntax_callback_context, &token->string_range);
    syntax_function_call_arguments(lexic_analyzer, token, syntax_callback_functions, syntax_callback_context);
}

static void syntax_statement_list(
    LexicAnalyzer lexic_analyzer[static 1],
    Token token[static 1],
    const SyntaxCallbackFunctions syntax_callback_functions[static 1],
    void *const syntax_callback_context
) {
    syntax_callback_functions->statement_list_begin(syntax_callback_context);

    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_LPAREN);

        while(true) {
            ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
            if(token->type != TOKEN_TYPE_LPAREN) {
                break;
            }
            ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
            switch(token->type) {
                case TOKEN_TYPE_KEYWORD_IF: {
                    syntax_callback_functions->statement(syntax_callback_context, SYNTAX_STATEMENT_TYPE_IF);
                    syntax_callback_functions->if_begin(syntax_callback_context);
                    syntax_function_call_argument(lexic_analyzer, token, true, syntax_callback_functions, syntax_callback_context);
                    syntax_statement_list(lexic_analyzer, token, syntax_callback_functions, syntax_callback_context);
                    syntax_statement_list(lexic_analyzer, token, syntax_callback_functions, syntax_callback_context);
                    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
                    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_RPAREN);
                    break;
                }
                case TOKEN_TYPE_KEYWORD_WHILE: {
                    syntax_callback_functions->statement(syntax_callback_context, SYNTAX_STATEMENT_TYPE_WHILE);
                    syntax_callback_functions->while_begin(syntax_callback_context);
                    syntax_function_call_argument(lexic_analyzer, token, true, syntax_callback_functions, syntax_callback_context);
                    syntax_statement_list(lexic_analyzer, token, syntax_callback_functions, syntax_callback_context);
                    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
                    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_RPAREN);
                    break;
                }
                case TOKEN_TYPE_KEYWORD_SET: {
                    syntax_callback_functions->statement(syntax_callback_context, SYNTAX_STATEMENT_TYPE_SET);
                    syntax_callback_functions->set_begin(syntax_callback_context);
                    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
                    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_IDENTIFIER);
                    syntax_function_call_argument(lexic_analyzer, token, true, syntax_callback_functions, syntax_callback_context);
                    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
                    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_RPAREN);
                    break;
                }
                case TOKEN_TYPE_KEYWORD_RETURN: {
                    syntax_callback_functions->statement(syntax_callback_context, SYNTAX_STATEMENT_TYPE_RETURN);
                    syntax_callback_functions->return_begin(syntax_callback_context);
                    syntax_function_call_argument(lexic_analyzer, token, true, syntax_callback_functions, syntax_callback_context);
                    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
                    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_RPAREN);
                    break;
                }
                case TOKEN_TYPE_IDENTIFIER: {
                    syntax_callback_functions->statement(syntax_callback_context, SYNTAX_STATEMENT_TYPE_FUNCTION_CALL);
                    syntax_callback_functions->function_call_begin(syntax_callback_context, &token->string_range);
                    syntax_function_call_arguments(lexic_analyzer, token, syntax_callback_functions, syntax_callback_context);
                    break;
                }
                default: {
                    ASSERT(false);
                }
            }
        }
    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_RPAREN);
}

static bool syntax_parse_function(
    LexicAnalyzer lexic_analyzer[static 1],
    Token token[static 1],
    const SyntaxCallbackFunctions syntax_callback_functions[static 1],
    void *const syntax_callback_context
) {
    if(!lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)) {
        return false;
    }
    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_LPAREN);
        ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
        ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_KEYWORD_FN);
        // syntax_callback_functions->function_definition_begin(syntax_callback_context);

        ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
        ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_IDENTIFIER);
        syntax_callback_functions->function_definition_begin(syntax_callback_context, &token->string_range);

        ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)); 
        ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_LPAREN); 

            syntax_callback_functions->function_definition_parameter_list_begin(syntax_callback_context);

            ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)); 
            while(token->type == TOKEN_TYPE_LPAREN) {
                    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)); 
                    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_IDENTIFIER); 
                    syntax_callback_functions->function_definition_parameter_name(syntax_callback_context, &token->string_range);

                    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)); 
                    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_TYPE_INT, TOKEN_TYPE_TYPE_FLOAT, TOKEN_TYPE_TYPE_STRING, TOKEN_TYPE_TYPE_BOOL); 
                    syntax_callback_functions->function_definition_parameter_type(syntax_callback_context, syntax_function_definition_parameter_type_from_token_type(token->type));

                ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)); 
                ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_RPAREN); 

                ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)); 
            } 
            syntax_callback_functions->function_definition_parameter_list_end(syntax_callback_context);
        ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_RPAREN);

        syntax_statement_list(lexic_analyzer, token, syntax_callback_functions, syntax_callback_context); 
    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
    ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_RPAREN);
    return true;
}
    
static void syntax_parse_functions(LexicAnalyzer lexic_analyzer[static 1], Token token[static 1], const SyntaxCallbackFunctions syntax_callback_functions[static 1], void *const syntax_callback_context) {
    while(syntax_parse_function(lexic_analyzer, token, syntax_callback_functions, syntax_callback_context)) {} 
}

typedef struct {
    size_t offset;
    size_t count;
} Range;

#define SYNTAX_CALLBACK_FIELDS \
    X(function_definitions, struct { StringRange name; Range parameter_range; size_t statement_list_index; }) \
    X(function_definition_parameters, struct { size_t identifier_index; SyntaxFunctionDefinitionParameterType type; }) \
    X(statement_lists, Range) \
    X(statements, struct { size_t index; SyntaxStatementType type; }) \
    X(statement_ifs, struct { size_t function_call_parameter_index; size_t true_branch_statement_list_index; size_t false_branch_statement_list_index; }) \
    X(statement_whiles, struct { size_t function_call_parameter_index; size_t statement_list_index; }) \
    X(statement_sets, struct { size_t identifier_index; size_t function_call_parameter_index; }) \
    X(statement_returns, struct { size_t function_call_parameter_index; }) \
    X(function_calls, struct { StringRange name; size_t function_call_parameter_range_index; }) \
    X(function_call_parameter_ranges, Range) \
    X(function_call_parameters, struct { size_t index; SyntaxFunctionCallParameterType type; }) \
    X(identifiers, StringRange) \
    X(constants_bools, StringRange) \
    X(constants_ints, StringRange) \
    X(constants_floats, StringRange) \
    X(constants_strings, StringRange)

typedef struct {
#define X(field, element_type) size_t field;
    SYNTAX_CALLBACK_FIELDS
#undef X
} SyntaxCallbackCounter;

static void syntax_callback_counter_function_definition_begin(SyntaxCallbackCounter data[static 1], const StringRange name[static 1]) {
    data->function_definitions++;
}
static void syntax_callback_counter_function_definition_parameter_name(SyntaxCallbackCounter data[static 1], const StringRange name[static 1]) {
    data->function_definition_parameters++;
}
static void syntax_callback_counter_function_definition_parameter_type(SyntaxCallbackCounter data[static 1], const SyntaxFunctionDefinitionParameterType type) {}
static void syntax_callback_counter_statement_list_begin(SyntaxCallbackCounter data[static 1]) {
    data->statement_lists++;
}
static void syntax_callback_counter_statement(SyntaxCallbackCounter data[static 1], const SyntaxStatementType type) {
    data->statements++;
}
static void syntax_callback_counter_if_begin(SyntaxCallbackCounter data[static 1]) {
    data->statement_ifs++;
}
static void syntax_callback_counter_while_begin(SyntaxCallbackCounter data[static 1]) {
    data->statement_whiles++;
}
static void syntax_callback_counter_set_begin(SyntaxCallbackCounter data[static 1]) {
    data->statement_sets++;
}
static void syntax_callback_counter_return_begin(SyntaxCallbackCounter data[static 1]) {
    data->statement_returns++;
}
static void syntax_callback_counter_function_call_begin(SyntaxCallbackCounter data[static 1], const StringRange name[static 1]) {
    data->function_calls++;
}
static void syntax_callback_counter_function_call_parameter_bool(SyntaxCallbackCounter data[static 1], const StringRange string_range[static 1]) {
    data->function_call_parameters++;
}
static void syntax_callback_counter_function_call_parameter_int(SyntaxCallbackCounter data[static 1], const StringRange string_range[static 1]) {
    data->function_call_parameters++;
}
static void syntax_callback_counter_function_call_parameter_float(SyntaxCallbackCounter data[static 1], const StringRange string_range[static 1]) {
    data->function_call_parameters++;
}
static void syntax_callback_counter_function_call_parameter_string(SyntaxCallbackCounter data[static 1], const StringRange name[static 1]) {
    data->function_call_parameters++;
}
static void syntax_callback_counter_function_call_parameter_function_call(SyntaxCallbackCounter data[static 1]) {
    data->function_call_parameters++;
}
static void syntax_callback_counter_function_call_parameter_string_range(SyntaxCallbackCounter data[static 1], const StringRange string_range[static 1]) {}

typedef struct {
#define X(name, ...) void(*name)(SyntaxCallbackCounter context[static 1] __VA_OPT__(,) __VA_ARGS__);
    SYNTAX_CALLBACK_FUNCTIONS
#undef X
} SyntaxCallbackFunctionsCounter;

static const SyntaxCallbackFunctionsCounter syntax_callback_functions_counter = {
#define X(name, ...) .name = syntax_callback_counter_ ## name,
    SYNTAX_CALLBACK_FUNCTIONS
#undef X
};

// typedef struct {
// #define X(field, element_type) struct { element_type *data; size_t count; } field;
//     SYNTAX_CALLBACK_FIELDS
// #undef X
// } SyntaxCallbackLayout;

// static void syntax_callback_breadth_first_layout_init(SyntaxCallbackBreadthFirstLayout syntax_callback_breadth_first_layout[static 1], const SyntaxCallbackCounter syntax_callback_counter[static 1]) {
//     syntax_callback_breadth_first_layout = (SyntaxCallbackBreadthFirstLayout){
//         .function_definition_parameters.data = calloc(syntax_callback_counter->function_definition_count)
//     }
// }

// static void syntax_callback_breadth_first_layout_function_definition_begin(SyntaxCallbackData data[static 1], const StringRange name[static 1]) {
//     SyntaxCallbackBreadthFirstLayout *const ctx = (SyntaxCallbackBreadthFirstLayout*)context;
//     ctx->function_definitions.data[ctx->function_definitions.count++].name = *name;
// }
// static void syntax_callback_breadth_first_layout_function_definition_parameter_list_begin(SyntaxCallbackData data[static 1]) {
//     SyntaxCallbackBreadthFirstLayout *const ctx = (SyntaxCallbackBreadthFirstLayout*)context;
//     ctx->function_definition_parameter_start_index = ctx->function_definition_parameters.count;
// }
// static void syntax_callback_breadth_first_layout_function_definition_parameter_list_end(SyntaxCallbackData data[static 1]) {
//     SyntaxCallbackBreadthFirstLayout *const ctx = (SyntaxCallbackBreadthFirstLayout*)context;
//     ctx->function_definitions.data[ctx->function_definitions.count - 1].parameter_range = (Range){
//         ctx->function_definition_parameter_start_index,
//         ctx->function_definition_parameters.count - ctx->function_definition_parameter_start_index
//     };
// }
//
// static void syntax_callback_breadth_first_layout_function_definition_parameter_name(SyntaxCallbackData data[static 1], const StringRange name[static 1]) {
//     SyntaxCallbackBreadthFirstLayout *const ctx = (SyntaxCallbackBreadthFirstLayout*)context;
//     ctx->function_definition_parameters.data[ctx->function_definition_parameters.count++].name = *name;
// }
//
// static void syntax_callback_breadth_first_layout_function_definition_parameter_type(SyntaxCallbackData data[static 1], const SyntaxFunctionDefinitionParameterType type) {
//     SyntaxCallbackBreadthFirstLayout *const ctx = (SyntaxCallbackBreadthFirstLayout*)context;
//     ctx->function_definition_parameters.data[ctx->function_definition_parameters.count - 1].type = type;
// }
//
// static const SyntaxCallbackFunctions syntax_callback_breadth_first_layout_functions = {
// #define X(name, ...) .name = syntax_callback_breadth_first_layout_ ## name,
//     SYNTAX_CALLBACK_FUNCTIONS
// #undef X
// };

int main(const int argc, const char *argv[]) {
    ASSERT(argc == 2);
    const int fd = open(argv[1], O_RDONLY);
    ASSERT_NOT_MINUS_ONE(fd);
    struct stat stat;
    ASSERT_NOT_MINUS_ONE(fstat(fd, &stat));
    char *const data = (char*)malloc((size_t)stat.st_size + 1);
    ASSERT(data != NULL);
    ASSERT(read(fd, data, (size_t)stat.st_size) == stat.st_size);
    data[stat.st_size] = 0;
    ASSERT_NOT_MINUS_ONE(close(fd));
    
    
    LexicAnalyzer lexic_analyzer;
    lexic_analyzer_init(&lexic_analyzer, data);
        Token token;
        while(lexic_analyzer_yield(&lexic_analyzer, &token)) {
            LOG_DEBUG_TOKEN_NAME(lexic_analyzer, token);
        }
        lexic_analyzer_reset(&lexic_analyzer);

        SyntaxCallbackCounter syntax_callback_counter = {0};
        syntax_parse_functions(&lexic_analyzer, &token, (const SyntaxCallbackFunctions*)&syntax_callback_functions_counter, &syntax_callback_counter);
        // LOG_DEBUG("function_definition_parameter_count: %lu", syntax_callback_counter.function_definition_parameter_count);
        // LOG_DEBUG("function_definition_count: %lu", syntax_callback_counter.function_definition_count);
        // LOG_DEBUG("statement_list_count: %lu", syntax_callback_counter.statement_list_count);
        // LOG_DEBUG("statement_count: %lu", syntax_callback_counter.statement_count);
        // LOG_DEBUG("function_call_count: %lu", syntax_callback_counter.function_call_count);
        // LOG_DEBUG("function_call_parameter_count: %lu", syntax_callback_counter.function_call_parameter_count);
        // LOG_DEBUG("if_count: %lu", syntax_callback_counter.if_count);
        // LOG_DEBUG("while_count: %lu", syntax_callback_counter.while_count);

    lexic_analyzer_deinit(&lexic_analyzer);


    free(data);
}
