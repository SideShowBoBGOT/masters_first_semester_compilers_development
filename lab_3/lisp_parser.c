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

#define ASSERT(expr, ...) \
    do {\
        if(!(expr)) {\
            fprintf(stderr, "%s:%d: %s: Assertion `%s' failed", __FILE__, __LINE__, __FUNCTION__, #expr);\
            __VA_OPT__(fprintf(stderr, " explanation: " __VA_ARGS__);)\
            fprintf(stderr, "\n");\
            abort();\
        }\
    } while(0)

#define ASSERT_NOT_MINUS_ONE(expr, ...) \
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

#define TOKENS_MAP \
    X(LPAREN, "[(]")\
    X(RPAREN, "[)]")\
    X(ELEMENT, "[\"\'\\a-zA-Z!$%&*/+-:<=>?^_~0-9]")\
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

#define ASSERT_TOKEN(lexic_analyzer, token, ...)\
    do {\
        const TokenType _valid_token_types[] = {__VA_ARGS__};\
        bool _found = false;\
        for(uint8_t _i = 0; _i < ARRAY_COUNT(_valid_token_types); ++_i) { _found |= (token)->type == _valid_token_types[_i]; }\
        ASSERT(_found, "Expected tokens `" STRINGIFY(__VA_ARGS__) "', but got: %s. Position %d:%d", token_type_str((token)->type), lexic_analyzer->newline_index, lexic_analyzer->offset - lexic_analyzer->newline_offset);\
    } while(0)

typedef enum {
    SYNTAX_ANALYZER_STATE_BEGIN,
    SYNTAX_ANALYZER_STATE_LOOP,
    SYNTAX_ANALYZER_STATE_END,
} SyntaxAnalyzerState;

typedef struct {
    SyntaxAnalyzerState state;
    size_t depth;
} SyntaxAnalyzer;

static bool syntax_yield(SyntaxAnalyzer syntax_analyzer[static 1], LexicAnalyzer lexic_analyzer[static 1], Token token[static 1]) {
    switch(syntax_analyzer->state) {
        case SYNTAX_ANALYZER_STATE_BEGIN: {
            lexic_analyzer_reset(lexic_analyzer);
            ASSERT(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token));
            ASSERT_TOKEN(lexic_analyzer, token, TOKEN_TYPE_LPAREN);
            syntax_analyzer->depth = 1;
            return true;
        }
        case SYNTAX_ANALYZER_STATE_LOOP: {
            if(lexic_analyzer_yield_no_whitespace(lexic_analyzer, token)) {
                switch(token->type) {
                    case TOKEN_TYPE_LPAREN: {
                        syntax_analyzer->depth++;
                        break;
                    }
                    case TOKEN_TYPE_RPAREN: {
                        ASSERT(syntax_analyzer->depth != 0, "Unmatched paren. Position %d:%d", lexic_analyzer->newline_index, lexic_analyzer->offset - lexic_analyzer->newline_offset);
                        syntax_analyzer->depth--;
                        break;
                    }
                    case TOKEN_TYPE_ELEMENT: {
                        break;
                    }
                    default: {
                        ASSERT(false);
                    }
                }
                return true;
            } else {
                return false;
            }
        }
        case SYNTAX_ANALYZER_STATE_END: {
            return false;
        }
        default: {
            ASSERT(false);
        }
    }
}

typedef struct {
    size_t offset;
    size_t count;
} Range;

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
    
    
    

    free(data);
}
