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

typedef enum {
    TOKEN_TYPE_LPAREN,
    TOKEN_TYPE_RPAREN,
    TOKEN_TYPE_KEYWORD_FN,
    TOKEN_TYPE_KEYWORD_IF,
    TOKEN_TYPE_KEYWORD_WHILE,
    TOKEN_TYPE_TYPENAME_INT,
    TOKEN_TYPE_TYPENAME_REAL,
    TOKEN_TYPE_TYPENAME_STRING,

    TOKEN_TYPE_IDENTIFIER,
    TOKEN_TYPE_BOOLEAN,
    TOKEN_TYPE_INTEGER,
    TOKEN_TYPE_FLOAT,
    TOKEN_TYPE_STRING,
    TOKEN_TYPE_NEWLINE,
    TOKEN_TYPE_WHITESPACE,
} TokenType;

static const char* token_regex_map[] = {
    [TOKEN_TYPE_LPAREN] = "[(]",
    [TOKEN_TYPE_RPAREN] = "[)]",
    [TOKEN_TYPE_KEYWORD_FN] = "fn",
    [TOKEN_TYPE_KEYWORD_IF] = "if",
    [TOKEN_TYPE_KEYWORD_WHILE] = "while",
    [TOKEN_TYPE_TYPENAME_INT] = "int",
    [TOKEN_TYPE_TYPENAME_REAL] = "real",
    [TOKEN_TYPE_TYPENAME_STRING] = "string",
    [TOKEN_TYPE_IDENTIFIER] = "[a-zA-Z!$%&*/:<=>?^_~][a-zA-Z!$%&*/:<=>?^_~0-9]*|[+]|[-]",
    [TOKEN_TYPE_BOOLEAN] = "true|false",
    [TOKEN_TYPE_INTEGER] = "[+-]?[0-9]+",
    [TOKEN_TYPE_FLOAT] = "[+-]?[0-9]+[.][0-9]+",
    [TOKEN_TYPE_STRING] = "\"[^\"]*\"",
    [TOKEN_TYPE_NEWLINE] = "\n",
    [TOKEN_TYPE_WHITESPACE] = "[ \t]+",
};

static const char* token_type_str(const TokenType type) {
    #define DEFINE_CASE(val) case val: return STRINGIFY(val)
        switch(type) {
            DEFINE_CASE(TOKEN_TYPE_LPAREN);
            DEFINE_CASE(TOKEN_TYPE_RPAREN);
            DEFINE_CASE(TOKEN_TYPE_KEYWORD_FN);
            DEFINE_CASE(TOKEN_TYPE_KEYWORD_IF);
            DEFINE_CASE(TOKEN_TYPE_KEYWORD_WHILE);
            DEFINE_CASE(TOKEN_TYPE_TYPENAME_INT);
            DEFINE_CASE(TOKEN_TYPE_TYPENAME_REAL);
            DEFINE_CASE(TOKEN_TYPE_TYPENAME_STRING);
            DEFINE_CASE(TOKEN_TYPE_IDENTIFIER);
            DEFINE_CASE(TOKEN_TYPE_BOOLEAN);
            DEFINE_CASE(TOKEN_TYPE_INTEGER);
            DEFINE_CASE(TOKEN_TYPE_FLOAT);
            DEFINE_CASE(TOKEN_TYPE_STRING);
            DEFINE_CASE(TOKEN_TYPE_NEWLINE);
            DEFINE_CASE(TOKEN_TYPE_WHITESPACE);
            default: {
                ASSERT(false);
            }
        }
    #undef DEFINE_CASE
}

typedef struct {
    regoff_t start;
    regoff_t end;
    TokenType type;
} Token;

#define LOG_DEBUG_TOKEN_NAME(lexic_analyzer, token) LOG_DEBUG("%.*s, %s", (token).end - (token).start, (lexic_analyzer).str + (token).start, token_type_str((token).type))

typedef struct {
    regex_t regex;
    regoff_t offset;
    regoff_t newline_index;
    regoff_t newline_offset;
    const char* str;
} LexicAnalyzer;

static void lexic_analyzer_init(LexicAnalyzer *const lexic_analyzer, const char* const str) {
    *lexic_analyzer = (LexicAnalyzer){.str = str};
    {
        size_t regex_string_len = 0;
        regex_string_len += ARRAY_COUNT(token_regex_map) - 1;
        regex_string_len += ARRAY_COUNT(token_regex_map) * 2;
        for(uint8_t i = 0; i < ARRAY_COUNT(token_regex_map); ++i) {
            regex_string_len += strlen(token_regex_map[i]);
        }
        regex_string_len += 3;
        char *const regex_string = malloc(regex_string_len + 1);
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
static void lexic_analyzer_deinit(LexicAnalyzer *const lexic_analyzer) {
    regfree(&lexic_analyzer->regex);
}

static bool lexic_analyzer_yield(LexicAnalyzer *const lexic_analyzer, Token *const token) {
    #define GROUP_OFFSET 2
    regmatch_t regmatch[ARRAY_COUNT(token_regex_map) + GROUP_OFFSET] = {0};
    if(regexec(&lexic_analyzer->regex, lexic_analyzer->str + lexic_analyzer->offset, ARRAY_COUNT(regmatch), regmatch, 0) != REG_NOMATCH) {
        // for debug puposes i want to be sure that token matches only for a single group
        bool group_found = false;
        for(uint8_t i = GROUP_OFFSET; i < (uint8_t)ARRAY_COUNT(regmatch); ++i) {
            if(regmatch[i].rm_so != -1 && regmatch[i].rm_eo != -1) {
                const TokenType token_type = (TokenType)i - GROUP_OFFSET;
                if(token_type == TOKEN_TYPE_NEWLINE) {
                    lexic_analyzer->newline_index += 1;
                    lexic_analyzer->newline_offset = lexic_analyzer->offset;
                }
                ASSERT(group_found == false);
                group_found = true;
                token->type = token_type;
                token->start = lexic_analyzer->offset + regmatch[0].rm_so;
                token->end = lexic_analyzer->offset + regmatch[0].rm_eo;
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
static bool lexic_analyzer_yield_no_whitespace(LexicAnalyzer *const lexic_analyzer, Token *const token) {
    while(lexic_analyzer_yield(lexic_analyzer, token)) {
        if(token->type != TOKEN_TYPE_NEWLINE && token->type != TOKEN_TYPE_WHITESPACE) {
            return true;
        }
    }
    return false;
}

static bool syntax_parse_function(LexicAnalyzer *const lexic_analyzer);

static void syntax_parse_functions(LexicAnalyzer *const lexic_analyzer) {
    while(syntax_parse_function(lexic_analyzer)) {} 
}

static bool syntax_parse_function(LexicAnalyzer *const lexic_analyzer) {
    Token token;
    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
    ASSERT(token.type == TOKEN_TYPE_LPAREN);
        ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
        ASSERT(token.type == TOKEN_TYPE_KEYWORD_FN);

        ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
        ASSERT(token.type == TOKEN_TYPE_IDENTIFIER);

        // paramlist
        ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
        ASSERT(token.type == TOKEN_TYPE_LPAREN);
            while(true) {
                ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
                if(token.type != TOKEN_TYPE_LPAREN) {
                    break;
                }
                    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
                    ASSERT(token.type == TOKEN_TYPE_IDENTIFIER);
                    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
                    ASSERT(token.type == TOKEN_TYPE_TYPENAME_INT || token.type == TOKEN_TYPE_TYPENAME_REAL || token.type == TOKEN_TYPE_TYPENAME_STRING);
                ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
                ASSERT(token.type == TOKEN_TYPE_RPAREN);
            }
        ASSERT(token.type == TOKEN_TYPE_RPAREN);
        
        // statement list
        ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
        ASSERT(token.type == TOKEN_TYPE_LPAREN);

        ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
        ASSERT(token.type == TOKEN_TYPE_RPAREN);
    ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, &token));
    ASSERT(token.type == TOKEN_TYPE_RPAREN);
    return true;
}

static void syntax_analyze(void) {}

int main(const int argc, const char *argv[]) {
    ASSERT(argc == 2);
    const int fd = open(argv[1], O_RDONLY);
    ASSERT_NOT_MINUS_ONE(fd);
    struct stat stat;
    ASSERT_NOT_MINUS_ONE(fstat(fd, &stat));
    char *const data = malloc((size_t)stat.st_size + 1);
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
        lexic_analyzer.newline_index = 0;
        lexic_analyzer.newline_offset = 0;
        lexic_analyzer.offset = 0;
        syntax_parse_functions(&lexic_analyzer);
    lexic_analyzer_deinit(&lexic_analyzer);
    free(data);
}
