#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
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
    TOKEN_TYPE_STRING,
    TOKEN_TYPE_LPAREN,
    TOKEN_TYPE_RPAREN,
    TOKEN_TYPE_INTEGER,
    TOKEN_TYPE_FLOAT,
    TOKEN_TYPE_IDENTIFIER,
} TokenType;

static const char* token_type_str(const TokenType type) {
    #define DEFINE_CASE(val) case val: return STRINGIFY(val)
        switch(type) {
            DEFINE_CASE(TOKEN_TYPE_STRING);
            DEFINE_CASE(TOKEN_TYPE_LPAREN);
            DEFINE_CASE(TOKEN_TYPE_RPAREN);
            DEFINE_CASE(TOKEN_TYPE_INTEGER);
            DEFINE_CASE(TOKEN_TYPE_FLOAT);
            DEFINE_CASE(TOKEN_TYPE_IDENTIFIER);
            default: {
                ASSERT(false);
            }
        }
    #undef DEFINE_CASE
}

typedef struct {
    size_t start;
    size_t end;
    TokenType type;
} Token;

static bool is_digit(const char c) {
    return c >= 48 && c <= 57;
}

static bool is_whitespace(const char c) {
    return c == ' '
        || c == '\n'
        || c == '\t';
}

static bool is_valid_character(const char c) {
    return is_whitespace(c)
        || c == '('
        || c == ')'
        || c >= 32
        || c <= 126; 
}

static bool lexer_yield(const size_t count, const char *const data, size_t *const index, Token *const token) {
    enum {
        LEXER_STATE_NONE,
        LEXER_STATE_STRING,
        LEXER_STATE_INTEGER,
        LEXER_STATE_IDENTIFIER,
        LEXER_STATE_FLOAT,
    } lexer_state = LEXER_STATE_NONE;

    for(; *index < count; ++*index) {
        const char c = data[*index];
        ASSERT_EXT(is_valid_character(c), "c: %c", c);
        switch(lexer_state) {
            case LEXER_STATE_NONE: {
                if(is_whitespace(c)) {
                } else if(c == '(') {
                    token->start = *index;
                    token->end = *index;
                    token->type = TOKEN_TYPE_LPAREN;
                    goto emit_token;
                } else if(c == ')') {
                    token->start = *index;
                    token->end = *index;
                    token->type = TOKEN_TYPE_RPAREN;
                    goto emit_token;
                } else if(c == '"') {
                    lexer_state = LEXER_STATE_STRING;
                    token->type = TOKEN_TYPE_STRING;
                    token->start = *index;
                } else if(is_digit(c)) {
                    lexer_state = LEXER_STATE_INTEGER;
                    token->type = TOKEN_TYPE_INTEGER;
                    token->start = *index;
                } else {
                    lexer_state = LEXER_STATE_IDENTIFIER;
                    token->type = TOKEN_TYPE_IDENTIFIER;
                    token->start = *index;
                }
                break;
            }
            case LEXER_STATE_STRING: {
                if(c == '"') {
                    token->end = *index;
                    goto emit_token;
                }
                break;
            }
            case LEXER_STATE_INTEGER: {
                if(is_digit(c)) {
                } else if(is_whitespace(c) || c == ')') {
                    token->end = *index - 1;
                    goto emit_token;
                } else if(c == '.') {
                    lexer_state = LEXER_STATE_FLOAT;
                    token->type = TOKEN_TYPE_FLOAT;
                } else {
                    ASSERT_EXT(false, "c: %c", c);
                }
                break;
            }
            case LEXER_STATE_FLOAT: {
                if(is_digit(c)) {
                } else if(is_whitespace(c) || c == ')') {
                    token->end = *index - 1;
                    goto emit_token;
                } else {
                    ASSERT_EXT(false, "c: %c", c);
                }
                break;
            }
            case LEXER_STATE_IDENTIFIER: {
                if(is_whitespace(c) || c == ')') {
                    token->end = *index - 1;
                    goto emit_token;
                }
                break;
            }
            default: {
                ASSERT_EXT(false, "c: %c", c);
            }
        }
    }
    return false;
    emit_token:
        ++*index;
        return true;
}

static void analyze_lexic(const size_t count, const char *const data) {
    Token token = {0};
    size_t index = 0;
    while(lexer_yield(count, data, &index, &token)) {
        const size_t token_len = token.end - token.start + 1;
        ASSERT_EXT(token_len <= INT_MAX, "token.end: %lu, token.start: %lu", token.end, token.start);
        printf("value: %.*s, type: %s\n", (int)token_len, data + token.start, token_type_str(token.type));
    }
    
}

int main(const int argc, const char *argv[]) {
    ASSERT(argc == 2);
    const int fd = open(argv[1], O_RDONLY);
    ASSERT_NOT_MINUS_ONE(fd);
    struct stat stat;
    ASSERT_NOT_MINUS_ONE(fstat(fd, &stat));
    char *const data = mmap(NULL, (size_t)stat.st_size, PROT_READ, MAP_SHARED, fd, 0); 

    analyze_lexic((size_t)stat.st_size, data);
    

    ASSERT_NOT_MINUS_ONE(munmap(data, (size_t)stat.st_size));
    ASSERT_NOT_MINUS_ONE(close(fd));
}
