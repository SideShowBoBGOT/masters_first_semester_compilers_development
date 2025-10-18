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


typedef struct {
    size_t index;
    size_t count;
    const char* data;
} Lexer;

typedef enum {
    TOKEN_TYPE_STRING,
    TOKEN_TYPE_LPAREN,
    TOKEN_TYPE_RPAREN,
} TokenType;

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

static bool lexer_yield(Lexer *const lexer, Token *const token) {
    enum {
        LEXER_STATE_NONE,
        LEXER_STATE_STRING,
        LEXER_STATE_INTEGER,
        LEXER_STATE_IDENTIFIER,
        LEXER_STATE_FLOAT,
    } lexer_state = {0};
    typedef union {
        struct {
            size_t start;
        } string;
        struct {
            size_t start;
        } integer;
        struct {
            size_t start;
        } identifier;
    } lexer_state_data = {0};
    for(; lexer->index < lexer->count; ++lexer->index) {
        const char c = lexer->data[i];
        ASSERT(is_valid_character(c));
        switch(lexer->state) {
            case LEXER_STATE_NONE: {
                if(is_whitespace(c)) {
                } else if(c == '(') {
                    token->start = lexer->index;
                    token->end = lexer->index;
                    token->type = TOKEN_TYPE_LPAREN;
                    ++lexer->index;
                    return true;
                } else if(c == ')') {
                    token->start = lexer->index;
                    token->end = lexer->index;
                    token->type = TOKEN_TYPE_RPAREN;
                    ++lexer->index;
                    return true;
                } else if(c == '"') {
                    lexer->state = LEXER_STATE_STRING;
                    lexer->state_data.string.start = lexer->index;
                } else if(is_digit(lexer->data[i])) {
                    lexer->state = LEXER_STATE_INTEGER;
                    lexer->state_data.integer.start = lexer->index;
                } else {
                    lexer->state = LEXER_STATE_IDENTIFIER;
                    lexer->state_data.identifier.start = lexer->index;
                }
                break;
            }
            case LEXER_STATE_STRING: {
                switch(lexer->data[i]) {
                    case '"': {
                        lexer->state = LEXER_STATE_NONE;
                        token->start = lexer->state_data.string.start;
                        token->end = lexer->index;
                        token->type = TOKEN_TYPE_STRING;
                        ++lexer->index;
                        return true;
                    }
                    default: {
                        break;
                    }
                }
                break;
            }
            case LEXER_STATE_INTEGER: {
                if(is_digit(c)) {
                } else if(is_whitespace(c)) {
                    lexer->state = LEXER_STATE_NONE;

                } else {
                    ASSERT(false);
                }
                break;
            }
        }
    }
    return false;
}

static void analyze_lexic(const size_t count, const char *const data) {
    size_t token_start = 0;
    size_t token_end = 0;
    bool token_processed = false;

    
}

int main(const int argc, const char *argv[]) {
    ASSERT(argc == 2);
    const int fd = open(argv[1], O_RDONLY);
    ASSERT_NOT_MINUS_ONE(fd);
    struct stat stat;
    ASSERT_NOT_MINUS_ONE(fstat(fd, &stat));
    char *const mapped_file = mmap(NULL, (size_t)stat.st_size, PROT_READ, MAP_SHARED, fd, 0); 
    

    ASSERT_NOT_MINUS_ONE(munmap(mapped_file, (size_t)stat.st_size));
    ASSERT_NOT_MINUS_ONE(close(fd));
}
