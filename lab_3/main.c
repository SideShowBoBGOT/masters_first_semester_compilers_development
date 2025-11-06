#ifndef _GNU_SOURCE
#define _GNU_SOURCE
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
#define PRINTFLN(str, ...) printf(str "\n" __VA_OPT__(,) __VA_ARGS__)

#define ASSERT_X(expr, file, line, function, ...)\
    do {\
        if(!(expr)) {\
            fprintf(stderr, "%s:%d: %s: Assertion `%s' failed.", (file), (line), (function), #expr);\
            __VA_OPT__(fprintf(stderr, " " __VA_ARGS__);)\
            fprintf(stderr, "\n");\
            abort();\
        }\
    } while(0)

#define ASSERT(expr, ...) ASSERT_X(expr, __FILE__, __LINE__, __FUNCTION__ __VA_OPT__(,) __VA_ARGS__)
    
#define ASSERT_NOT_MINUS_ONE(expr, ...) \
    do {\
        if((expr) == -1) {\
            fprintf(stderr, "%s:%d: %s: errno: %d: strerror: %s: Assertion `%s' failed.", __FILE__, __LINE__, __FUNCTION__, errno, strerror(errno), #expr);\
            __VA_OPT__(fprintf(stderr, " " __VA_ARGS__);)\
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

#define ARRAY_COUNT(arr) (sizeof((arr)) / sizeof((arr)[0]))
#define DYNAMIC_ARRAY_SIZE(arr) ((arr)->capacity * sizeof(*(arr)->data))

#define TOKENS_MAP \
    X(LPAREN, "[(]")\
    X(RPAREN, "[)]")\
    X(ATOM, "[\\a-zA-Z!$%&*/+-:<=>?^_~0-9]+")\
    X(NEWLINE, "\n")\
    X(SPACETAB, "[ \t]+")

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
        ASSERT(regex_string);
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
    ASSERT(lexic_analyzer->offset == (regoff_t)strlen(lexic_analyzer->str), "unrecognized input at %d:%d", lexic_analyzer->newline_index, lexic_analyzer->offset - lexic_analyzer->newline_offset);
    return false;
    #undef GROUP_OFFSET
}

static bool lexic_analyzer_yield_no_whitespace(LexicAnalyzer lexic_analyzer[static 1], Token token[static 1]) {
    while(lexic_analyzer_yield(lexic_analyzer, token)) {
        if(token->type != TOKEN_TYPE_NEWLINE && token->type != TOKEN_TYPE_SPACETAB) {
            return true;
        }
    }
    return false;
}

typedef struct {
    size_t offset;
    size_t count;
} Range;

typedef enum {
    SYNTAX_LIST_ELEMENT_TYPE_LIST,
    SYNTAX_LIST_ELEMENT_TYPE_ATOM,
} SyntaxListElementType;

typedef enum {
    SYNTAX_ATOM_PROPERTY_INVALID,
    SYNTAX_ATOM_PROPERTY_TYPE_INT,
    SYNTAX_ATOM_PROPERTY_TYPE_FLOAT,
    SYNTAX_ATOM_PROPERTY_TYPE_BOOL,
    SYNTAX_ATOM_PROPERTY_VARIABLE,
    SYNTAX_ATOM_PROPERTY_INT,
    SYNTAX_ATOM_PROPERTY_FLOAT,
    SYNTAX_ATOM_PROPERTY_BOOL,
    SYNTAX_ATOM_PROPERTY_PROGRAM,
    SYNTAX_ATOM_PROPERTY_SET,
    SYNTAX_ATOM_PROPERTY_IF,
    SYNTAX_ATOM_PROPERTY_WHILE,
    SYNTAX_ATOM_PROPERTY_RETURN,
    SYNTAX_ATOM_PROPERTY_MUL,
    SYNTAX_ATOM_PROPERTY_DIV,
    SYNTAX_ATOM_PROPERTY_ADD,
    SYNTAX_ATOM_PROPERTY_SUB,
    SYNTAX_ATOM_PROPERTY_POW,
} SyntaxAtomProperty;

typedef enum {
    SYNTAX_LIST_PROPERTY_INVALID,
    SYNTAX_LIST_PROPERTY_GLOBAL,
    SYNTAX_LIST_PROPERTY_PROGRAM,
    SYNTAX_LIST_PROPERTY_PARAM_LIST,
    SYNTAX_LIST_PROPERTY_PARAM_TYPE_AND_NAME,
    SYNTAX_LIST_PROPERTY_FUNCTION_CALL,
    SYNTAX_LIST_PROPERTY_PROGRAM_STATEMENT_LIST,
    SYNTAX_LIST_PROPERTY_STATEMENT_LIST,
    SYNTAX_LIST_PROPERTY_STATEMENT_IF,
    SYNTAX_LIST_PROPERTY_STATEMENT_WHILE,
    SYNTAX_LIST_PROPERTY_STATEMENT_SET,
    SYNTAX_LIST_PROPERTY_STATEMENT_RETURN,
} SyntaxListProperty;

typedef struct {
    SyntaxListElementType type;
    size_t index;
} SyntaxListElement;

typedef struct {
    struct {
        Range *data;
        size_t capacity;
    } list_arr;
    struct {
        SyntaxListProperty *data;
        size_t capacity;
    } list_property_arr;
    struct {
        SyntaxListElement *data;
        size_t capacity;
    } list_element_arr;
    struct {
        StringRange *data;
        size_t capacity;
    } atom_arr;
    struct {
        SyntaxAtomProperty *data;
        size_t capacity;
    } atom_property_arr;
} SyntaxTree;

static void syntax_tree_print(const SyntaxTree syntax_tree[static 1], const char data[]) {
    LOG_DEBUG("syntax_tree->list_arr.capacity: %lu", syntax_tree->list_arr.capacity);
    LOG_DEBUG("syntax_tree->list_element_arr.capacity: %lu", syntax_tree->list_element_arr.capacity);
    LOG_DEBUG("syntax_tree->atom_arr.capacity: %lu", syntax_tree->atom_arr.capacity);
    PRINTFLN("Atoms:");
    for(size_t i = 0; i < syntax_tree->atom_arr.capacity; ++i) {
        const StringRange *const atom = &syntax_tree->atom_arr.data[i];
        PRINTFLN("\tElement Atom %lu: %.*s", i, atom->end - atom->start, data + atom->start);
    }
    for(size_t i = 0; i < syntax_tree->list_arr.capacity; ++i) {
        PRINTFLN("List %lu:", i);
        const Range *const list = &syntax_tree->list_arr.data[i];
        for(size_t j = 0; j < list->count; ++j) {
            const size_t list_element_index = list->offset + j;  
            const SyntaxListElement *const list_element = &syntax_tree->list_element_arr.data[list_element_index];
            switch(list_element->type) {
                case SYNTAX_LIST_ELEMENT_TYPE_ATOM: {
                    const StringRange *const atom = &syntax_tree->atom_arr.data[list_element->index];
                    PRINTFLN("\tElement Atom %lu: %.*s", list_element->index, atom->end - atom->start, data + atom->start);
                    break;
                }
                case SYNTAX_LIST_ELEMENT_TYPE_LIST: {
                    PRINTFLN("\tElement List %lu", list_element->index);
                    break;
                }
                default: {
                    ASSERT(false);
                }
            }
        }
    }
}

#define ATOM_PATTERNS\
    X(PROGRAM, "program")\
    X(WHILE, "while")\
    X(IF, "if")\
    X(RETURN, "return")\
    X(TYPE_INT, "int")\
    X(TYPE_FLOAT, "float")\
    X(TYPE_STRING, "string")\
    X(TYPE_BOOL, "bool")\
    X(IDENTIFIER, "[a-zA-Z!$%&*/:<=>?^_~][a-zA-Z!$%&*/:<=>?^_~0-9]*|[+]|[-]")\
    X(BOOL, "true|false")\
    X(INT, "[+-]?[0-9]+")\
    X(FLOAT, "[+-]?[0-9]+[.][0-9]+")\
    X(SET, ":=")\
    X(MUL, "*")\
    X(DIV, "/")\
    X(ADD, "+")\
    X(SUB, "-")\
    X(POW, "^")\

typedef enum {
#define X(name, pattern) ATOM_TYPE_ ## name,
    ATOM_PATTERNS
#undef X
} AtomType;

typedef struct {
#define X(name, pattern) regex_t name;
    ATOM_PATTERNS
#undef X
} AtomTypeRegexes;

static void atom_type_regexes_init(AtomTypeRegexes atom_type_regexes[static 1]) {
    #define X(name, pattern) ASSERT(regcomp(&atom_type_regexes->name, "^" pattern, REG_EXTENDED) == 0);
        ATOM_PATTERNS
    #undef X
}
static void atom_type_regexes_deinit(AtomTypeRegexes atom_type_regexes[static 1]) {
    #define X(name, pattern) regfree(&atom_type_regexes->name);
        ATOM_PATTERNS
    #undef X
}

#define ASSERT_REGMATCH_ATOM_X(regmatch, atom, file, line, function)\
    do {\
        ASSERT_X((regmatch).rm_so == 0, (file), (line), (function));\
        ASSERT_X(((regmatch).rm_eo - (regmatch).rm_so) == ((atom)->end - (atom)->start), (file), (line), (function));\
    } while(0)
    
#define ASSERT_REGMATCH_ATOM(regmatch, atom) ASSERT_REGMATCH_ATOM_X((regmatch), (atom), __FILE__, __LINE__, __FUNCTION__)

static void assert_atom_regex(const char program_text[], const StringRange atom_arr[], const SyntaxListElement list_el[static 1], const size_t regexes_count, const regex_t *const regexes[], const char file[], const int line, const char function[]) {
    regmatch_t regmatch;
    ASSERT_X(list_el->type == SYNTAX_LIST_ELEMENT_TYPE_ATOM, file, line, function);
    const StringRange *const atom = &atom_arr[list_el->index];
    for(size_t i = 0; i < regexes_count; ++i) {
        // LOG_DEBUG("%.*s", atom->end - atom->start, program_text + atom->start);
        // LOG_DEBUG("index: %lu", i);
        if(regexec(regexes[i], program_text + atom->start, 1, &regmatch, 0) != REG_NOMATCH) {
            ASSERT_REGMATCH_ATOM_X(regmatch, atom, file, line, function);
            return;
        }
    }
    ASSERT(false);
}

#define ASSERT_ATOM_REGEX(list_el, syntax_tree, ...) assert_atom_regex((program_text), (syntax_tree)->atom_arr.data, (list_el), ARRAY_COUNT(((const regex_t*const[]){__VA_ARGS__})), ((const regex_t*const[]){__VA_ARGS__}), __FILE__, __LINE__, __FUNCTION__)

static void syntax_simple_argument(const SyntaxListElement list_el[static 1], const SyntaxTree syntax_tree[static 1], const AtomTypeRegexes atom_type_regexes[static 1], const char program_text[]) {
    ASSERT(list_el->type == SYNTAX_LIST_ELEMENT_TYPE_ATOM);
    const StringRange *const atom = &syntax_tree->atom_arr.data[list_el->index];
    regmatch_t regmatch = {0};
    if(regexec(&atom_type_regexes->IDENTIFIER, program_text + atom->start, 1, &regmatch, 0) != REG_NOMATCH) {
        syntax_tree->atom_property_arr.data[list_el->index] = SYNTAX_ATOM_PROPERTY_VARIABLE; 
    } else if(regexec(&atom_type_regexes->INT, program_text + atom->start, 1, &regmatch, 0) != REG_NOMATCH) {
        syntax_tree->atom_property_arr.data[list_el->index] = SYNTAX_ATOM_PROPERTY_INT; 
    } else if(regexec(&atom_type_regexes->FLOAT, program_text + atom->start, 1, &regmatch, 0) != REG_NOMATCH) {
        syntax_tree->atom_property_arr.data[list_el->index] = SYNTAX_ATOM_PROPERTY_FLOAT; 
    } else if(regexec(&atom_type_regexes->BOOL, program_text + atom->start, 1, &regmatch, 0) != REG_NOMATCH) {
        syntax_tree->atom_property_arr.data[list_el->index] = SYNTAX_ATOM_PROPERTY_BOOL; 
    } else {
        ASSERT(false);
    }
}

static void syntax_argument(const SyntaxListElement list_el[static 1], const SyntaxTree syntax_tree[static 1], const AtomTypeRegexes atom_type_regexes[static 1], const char program_text[]) {
    switch(list_el->type) {
        case SYNTAX_LIST_ELEMENT_TYPE_ATOM: {
            syntax_simple_argument(list_el, syntax_tree, atom_type_regexes, program_text);
            break;
        }
        case SYNTAX_LIST_ELEMENT_TYPE_LIST: {
            const Range *const list = &syntax_tree->list_arr.data[list_el->index];
            syntax_tree->list_property_arr.data[list_el->index] = SYNTAX_LIST_PROPERTY_FUNCTION_CALL;
            ASSERT(list->count > 0);
            const SyntaxListElement *sub_list_el = &syntax_tree->list_element_arr.data[list->offset];
            ASSERT(sub_list_el->type == SYNTAX_LIST_ELEMENT_TYPE_ATOM);
            syntax_tree->atom_property_arr.data[sub_list_el->index] = SYNTAX_ATOM_PROPERTY_FUNCTION_NAME;
            for(size_t sub_list_el_index = 1; sub_list_el_index < list->count; ++sub_list_el_index) {
                syntax_simple_argument(sub_list_el + sub_list_el_index, syntax_tree, atom_type_regexes, program_text);
            }
            break;
        }
        default: {
            ASSERT(false);
        }
    }
}

static void syntax_statement_list(const SyntaxListElement list_el[static 1], const SyntaxTree syntax_tree[static 1], const AtomTypeRegexes atom_type_regexes[static 1], const char program_text[]) {
    ASSERT(list_el->type == SYNTAX_LIST_ELEMENT_TYPE_LIST);
    {
        const Range *const statement_list = &syntax_tree->list_arr.data[list_el->index];
        syntax_tree->list_property_arr.data[list_el->index] = SYNTAX_LIST_PROPERTY_STATEMENT_LIST;
        for(size_t statement_list_el_index = 0; statement_list_el_index < statement_list->count; ++statement_list_el_index) {
            const SyntaxListElement *const statement_list_el = &syntax_tree->list_element_arr.data[statement_list->offset + statement_list_el_index];
            ASSERT(statement_list_el->type == SYNTAX_LIST_ELEMENT_TYPE_LIST);
            const Range *const statement = &syntax_tree->list_arr.data[statement_list_el->index];
            ASSERT(statement->count > 0);
            const SyntaxListElement *statement_el = &syntax_tree->list_element_arr.data[statement->offset];
            ASSERT(statement_el->type == SYNTAX_LIST_ELEMENT_TYPE_ATOM);
            const StringRange *const statement_head = &syntax_tree->atom_arr.data[statement_el->index];

            regmatch_t regmatch = {0};
            if(regexec(&atom_type_regexes->IF, program_text + statement_head->start, 1, &regmatch, 0) != REG_NOMATCH) {
                ASSERT_REGMATCH_ATOM(regmatch, statement_head);
                syntax_tree->list_property_arr.data[statement_list_el->index] = SYNTAX_LIST_PROPERTY_STATEMENT_IF;
                syntax_tree->atom_property_arr.data[statement_el->index] = SYNTAX_ATOM_PROPERTY_IF;
                ASSERT(statement->count == 3);
                // condition
                statement_el++;
                syntax_simple_argument(statement_el, syntax_tree, atom_type_regexes, program_text);
                // true statement list
                statement_el++;
                syntax_statement_list(statement_el, syntax_tree, atom_type_regexes, program_text);
            } else if(regexec(&atom_type_regexes->WHILE, program_text + statement_head->start, 1, &regmatch, 0) != REG_NOMATCH) {
                ASSERT_REGMATCH_ATOM(regmatch, statement_head);
                syntax_tree->list_property_arr.data[statement_list_el->index] = SYNTAX_LIST_PROPERTY_STATEMENT_WHILE;
                syntax_tree->atom_property_arr.data[statement_el->index] = SYNTAX_ATOM_PROPERTY_WHILE;
                ASSERT(statement->count == 3);
                // condition
                statement_el++;
                syntax_simple_argument(statement_el, syntax_tree, atom_type_regexes, program_text);
                // statement list
                statement_el++;
                syntax_statement_list(statement_el, syntax_tree, atom_type_regexes, program_text);
            } else if(regexec(&atom_type_regexes->SET, program_text + statement_head->start, 1, &regmatch, 0) != REG_NOMATCH) {
                ASSERT_REGMATCH_ATOM(regmatch, statement_head);
                syntax_tree->list_property_arr.data[statement_list_el->index] = SYNTAX_LIST_PROPERTY_STATEMENT_SET;
                syntax_tree->atom_property_arr.data[statement_el->index] = SYNTAX_ATOM_PROPERTY_SET;
                ASSERT(statement->count == 2);
                statement_el++;
                ASSERT_ATOM_REGEX(statement_el, syntax_tree, &atom_type_regexes->IDENTIFIER);
                syntax_tree->atom_property_arr.data[statement_el->index] = SYNTAX_ATOM_PROPERTY_VARIABLE;
                statement_el++;
                syntax_argument(statement_el, syntax_tree, atom_type_regexes, program_text);
            } else if(regexec(&atom_type_regexes->RETURN, program_text + statement_head->start, 1, &regmatch, 0) != REG_NOMATCH) {
                ASSERT_REGMATCH_ATOM(regmatch, statement_head);
                syntax_tree->list_property_arr.data[statement_list_el->index] = SYNTAX_LIST_PROPERTY_STATEMENT_RETURN;
                syntax_tree->atom_property_arr.data[statement_el->index] = SYNTAX_ATOM_PROPERTY_KEYWORD_RETURN;
                ASSERT(statement->count == 2);
                statement_el++;
                syntax_simple_argument(statement_el, syntax_tree, atom_type_regexes, program_text);
            } else {
                ASSERT(false);
            }
        }
    }
}

static SyntaxTree syntax_tree_init(LexicAnalyzer lexic_analyzer[static 1], Token token[static 1]) {
    const char *const program_text = lexic_analyzer->str;
    SyntaxTree syntax_tree = {.list_arr.capacity = 1};
    lexic_analyzer_reset(lexic_analyzer);
    size_t max_depth_index = 0;
    {
        size_t depth_index = 0;
        while(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)) {
            switch(token->type) {
                case TOKEN_TYPE_LPAREN: {
                    syntax_tree.list_element_arr.capacity++;
                    depth_index++;
                    max_depth_index++;
                    syntax_tree.list_arr.capacity++;
                    break;
                }
                case TOKEN_TYPE_RPAREN: {
                    ASSERT(depth_index != 0, "Unmatched paren. Position %d:%d", lexic_analyzer->newline_index, lexic_analyzer->offset - lexic_analyzer->newline_offset);
                    depth_index--;
                    break;
                }
                case TOKEN_TYPE_ATOM: {
                    syntax_tree.list_element_arr.capacity++;
                    syntax_tree.atom_arr.capacity++;
                    break;
                }
                default: {
                    ASSERT(false);
                }
            }
        }
    }
    syntax_tree.atom_property_arr.capacity = syntax_tree.atom_arr.capacity;
    syntax_tree.list_property_arr.capacity = syntax_tree.list_arr.capacity;

    syntax_tree.list_arr.data = malloc(DYNAMIC_ARRAY_SIZE(&syntax_tree.list_arr));
    memset(syntax_tree.list_arr.data, 0, DYNAMIC_ARRAY_SIZE(&syntax_tree.list_arr));

    syntax_tree.list_property_arr.data = malloc(DYNAMIC_ARRAY_SIZE(&syntax_tree.list_property_arr));
    memset(syntax_tree.list_property_arr.data, 0, DYNAMIC_ARRAY_SIZE(&syntax_tree.list_property_arr));

    syntax_tree.list_element_arr.data = malloc(DYNAMIC_ARRAY_SIZE(&syntax_tree.list_element_arr));
    memset(syntax_tree.list_element_arr.data, 0, DYNAMIC_ARRAY_SIZE(&syntax_tree.list_element_arr));

    syntax_tree.atom_arr.data = malloc(DYNAMIC_ARRAY_SIZE(&syntax_tree.atom_arr));
    memset(syntax_tree.atom_arr.data, 0, DYNAMIC_ARRAY_SIZE(&syntax_tree.atom_arr));

    syntax_tree.atom_property_arr.data = malloc(DYNAMIC_ARRAY_SIZE(&syntax_tree.atom_property_arr));
    memset(syntax_tree.atom_property_arr.data, 0, DYNAMIC_ARRAY_SIZE(&syntax_tree.atom_property_arr));

    size_t *const list_index_arr = (size_t*)calloc(max_depth_index + 1, sizeof(size_t));
    {
        lexic_analyzer_reset(lexic_analyzer);
        size_t depth_index = 0;
        size_t list_index = 0;
        size_t atom_index = 0;
        list_index_arr[depth_index] = list_index;
        while(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)) {
            switch(token->type) {
                case TOKEN_TYPE_LPAREN: {
                    syntax_tree.list_arr.data[list_index_arr[depth_index]].count++;
                    list_index++;
                    depth_index++;
                    list_index_arr[depth_index] = list_index; 
                    break;
                }
                case TOKEN_TYPE_RPAREN: {
                    depth_index--;
                    break;
                }
                case TOKEN_TYPE_ATOM: {
                    syntax_tree.list_arr.data[list_index_arr[depth_index]].count++;
                    syntax_tree.atom_arr.data[atom_index++] = token->string_range;
                    break;
                }
                default: {
                    ASSERT(false);
                }
            }
        }
    }
    {
        size_t cumulative_offset = 0;
        for(size_t i = 0; i < syntax_tree.list_arr.capacity; ++i) {
            syntax_tree.list_arr.data[i].offset = cumulative_offset;
            cumulative_offset += syntax_tree.list_arr.data[i].count;
        }
    }
    {
        lexic_analyzer_reset(lexic_analyzer);
        size_t depth_index = 0;
        size_t sequential_list_index = 0;
        size_t sequential_atom_index = 0;
        list_index_arr[depth_index] = sequential_list_index;
        size_t *const list_count_arr = (size_t*)calloc(syntax_tree.list_arr.capacity, sizeof(size_t));
        ASSERT(list_count_arr);
        memset(list_count_arr, 0, syntax_tree.list_arr.capacity);
        while(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)) {
            switch(token->type) {
                case TOKEN_TYPE_LPAREN: {
                    sequential_list_index++;
                    {
                        const size_t list_index = list_index_arr[depth_index]; 
                        const size_t list_element_index = syntax_tree.list_arr.data[list_index].offset + list_count_arr[list_index];
                        syntax_tree.list_element_arr.data[list_element_index] = (SyntaxListElement){.index=sequential_list_index, .type=SYNTAX_LIST_ELEMENT_TYPE_LIST};
                        list_count_arr[list_index]++;
                    }
                    depth_index++;
                    list_index_arr[depth_index] = sequential_list_index; 
                    break;
                }
                case TOKEN_TYPE_RPAREN: {
                    depth_index--;
                    break;
                }
                case TOKEN_TYPE_ATOM: {
                    {
                        const size_t list_index = list_index_arr[depth_index]; 
                        const size_t list_element_index = syntax_tree.list_arr.data[list_index].offset + list_count_arr[list_index];
                        syntax_tree.list_element_arr.data[list_element_index] = (SyntaxListElement){.index=sequential_atom_index, .type=SYNTAX_LIST_ELEMENT_TYPE_ATOM};
                        list_count_arr[list_index]++;
                    }
                    sequential_atom_index++;
                    break;
                }
                default: {
                    ASSERT(false);
                }
            }
        }
        free(list_count_arr);
    }
    free(list_index_arr);
    syntax_tree_print(&syntax_tree, lexic_analyzer->str);
    {
        AtomTypeRegexes atom_type_regexes = {0};
        atom_type_regexes_init(&atom_type_regexes);
            const Range *const global_scope_list = &syntax_tree.list_arr.data[0];
            syntax_tree.list_property_arr.data[0] = SYNTAX_LIST_PROPERTY_GLOBAL;

            ASSERT(global_scope_list->count == 1);

            const SyntaxListElement *const global_list_el = &syntax_tree.list_element_arr.data[global_scope_list->offset];
            ASSERT(global_list_el->type == SYNTAX_LIST_ELEMENT_TYPE_LIST);
            syntax_tree.list_property_arr.data[global_scope_list->offset] = SYNTAX_LIST_PROPERTY_PROGRAM;
            const Range *const program_list = &syntax_tree.list_arr.data[global_list_el->index];
            ASSERT(program_list->count == 3);

            const SyntaxListElement * program_list_el = &syntax_tree.list_element_arr.data[program_list->offset];
            ASSERT_ATOM_REGEX(program_list_el, &syntax_tree, &atom_type_regexes.PROGRAM);
            syntax_tree.atom_property_arr.data[program_list_el->index] = SYNTAX_ATOM_PROPERTY_PROGRAM;

            program_list_el++;
            ASSERT(program_list_el->type == SYNTAX_LIST_ELEMENT_TYPE_LIST);
            syntax_tree.list_property_arr.data[program_list_el->index] = SYNTAX_LIST_PROPERTY_PARAM_LIST;

            {
                const Range *const param_list = &syntax_tree.list_arr.data[program_list_el->index];
                for(size_t param_list_el_index = 0; param_list_el_index < param_list->count; ++param_list_el_index) {
                    const SyntaxListElement *const param_list_el = &syntax_tree.list_element_arr.data[param_list->offset + param_list_el_index];
                    ASSERT(param_list_el->type == SYNTAX_LIST_ELEMENT_TYPE_LIST);
                    const Range *const id_type_list = &syntax_tree.list_arr.data[param_list_el->index];
                    ASSERT(id_type_list->count == 2);
                    syntax_tree.list_property_arr.data[param_list_el->index] = SYNTAX_LIST_PROPERTY_PARAM_TYPE_AND_NAME;

                    const SyntaxListElement *id_type_list_element = &syntax_tree.list_element_arr.data[id_type_list->offset];
                    ASSERT_ATOM_REGEX(id_type_list_element, &syntax_tree, &atom_type_regexes.IDENTIFIER);
                    syntax_tree.atom_property_arr.data[id_type_list_element->index] = SYNTAX_ATOM_PROPERTY_VARIABLE;

                    id_type_list_element++;
                    ASSERT(id_type_list_element->type == SYNTAX_LIST_ELEMENT_TYPE_ATOM);
                    const StringRange *const atom = &syntax_tree.atom_arr.data[id_type_list_element->index];

                    regmatch_t regmatch = {0};
                    if(regexec(&atom_type_regexes.TYPE_BOOL, program_text + atom->start, 1, &regmatch, 0) != REG_NOMATCH) {
                        syntax_tree.atom_property_arr.data[id_type_list_element->index] = SYNTAX_ATOM_PROPERTY_TYPE_BOOL;
                    } else if(regexec(&atom_type_regexes.TYPE_INT, program_text + atom->start, 1, &regmatch, 0) != REG_NOMATCH) {
                        syntax_tree.atom_property_arr.data[id_type_list_element->index] = SYNTAX_ATOM_PROPERTY_TYPE_INT;
                    } else if(regexec(&atom_type_regexes.TYPE_FLOAT, program_text + atom->start, 1, &regmatch, 0) != REG_NOMATCH) {
                        syntax_tree.atom_property_arr.data[id_type_list_element->index] = SYNTAX_ATOM_PROPERTY_TYPE_FLOAT;
                    } else {
                        ASSERT(false);
                    }
                }
            }
            program_list_el++;

            syntax_statement_list(program_list_el, &syntax_tree, &atom_type_regexes, program_text);
            syntax_tree.list_property_arr.data[program_list_el->index] = SYNTAX_LIST_PROPERTY_PROGRAM_STATEMENT_LIST;
        atom_type_regexes_deinit(&atom_type_regexes);
    }
    for(size_t i = 0; i < syntax_tree.list_property_arr.capacity; ++i) {
        ASSERT(syntax_tree.list_property_arr.data[i] != SYNTAX_LIST_PROPERTY_INVALID);
    }
    for(size_t i = 0; i < syntax_tree.atom_property_arr.capacity; ++i) {
        ASSERT(syntax_tree.atom_property_arr.data[i] != SYNTAX_ATOM_PROPERTY_INVALID);
    }
    for(size_t i = 0; i < syntax_tree.list_property_arr.capacity; ++i) {
        switch(syntax_tree.list_property_arr.data[i]) {
            case SYNTAX_LIST_PROPERTY_FUNCTION_DEFINITION_STATEMENT_LIST: {
                ASSERT(syntax_tree.list_arr.data[i].count > 0);
                for(size_t list_el_index = 0; list_el_index < syntax_tree.list_arr.data[i].count - 1; ++list_el_index) {
                    const SyntaxListElement *const list_el = &syntax_tree.list_element_arr.data[syntax_tree.list_arr.data[i].offset + list_el_index];
                    ASSERT(list_el->type == SYNTAX_LIST_ELEMENT_TYPE_LIST);
                    ASSERT(syntax_tree.list_property_arr.data[list_el->index] != SYNTAX_LIST_PROPERTY_STATEMENT_RETURN);
                }
                const SyntaxListElement *const list_el = &syntax_tree.list_element_arr.data[syntax_tree.list_arr.data[i].offset + syntax_tree.list_arr.data[i].count - 1];
                ASSERT(list_el->type == SYNTAX_LIST_ELEMENT_TYPE_LIST);
                ASSERT(syntax_tree.list_property_arr.data[list_el->index] == SYNTAX_LIST_PROPERTY_STATEMENT_RETURN);
                break;
            }
            case SYNTAX_LIST_PROPERTY_STATEMENT_LIST: {
                for(size_t list_el_index = 0; list_el_index < syntax_tree.list_arr.data[i].count; ++list_el_index) {
                    const SyntaxListElement *const list_el = &syntax_tree.list_element_arr.data[syntax_tree.list_arr.data[i].offset + list_el_index];
                    if(list_el->type == SYNTAX_LIST_ELEMENT_TYPE_LIST) {
                        ASSERT(syntax_tree.list_property_arr.data[list_el->index] != SYNTAX_LIST_PROPERTY_STATEMENT_RETURN);
                    }
                }
                break;
            }
            default: {
                break;
            }
        }
    }


    for(size_t i = 0; i < syntax_tree.list_arr.capacity; ++i) {
        if(syntax_tree.list_property_arr.data[i] == SYNTAX_LIST_PROPERTY_STATEMENT_SET) {
            syntax_tree.list_arr.data[i].offset
        }
    }    


    return syntax_tree;
}

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

        const SyntaxTree syntax_tree = syntax_tree_init(&lexic_analyzer, &token);
    lexic_analyzer_deinit(&lexic_analyzer);
    

    free(data);
}
