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
    TOKEN_TYPE_IDENTIFIER,
    TOKEN_TYPE_BOOLEAN,
    TOKEN_TYPE_LPAREN,
    TOKEN_TYPE_RPAREN,
    TOKEN_TYPE_INTEGER,
    TOKEN_TYPE_FLOAT,
    TOKEN_TYPE_STRING,
} TokenType;

static const char* token_type_str(const TokenType type) {
    #define DEFINE_CASE(val) case val: return STRINGIFY(val)
        switch(type) {
            DEFINE_CASE(TOKEN_TYPE_IDENTIFIER);
            DEFINE_CASE(TOKEN_TYPE_BOOLEAN);
            DEFINE_CASE(TOKEN_TYPE_LPAREN);
            DEFINE_CASE(TOKEN_TYPE_RPAREN);
            DEFINE_CASE(TOKEN_TYPE_INTEGER);
            DEFINE_CASE(TOKEN_TYPE_FLOAT);
            DEFINE_CASE(TOKEN_TYPE_STRING);
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

static bool is_digit(const char c) {
    return c >= '0' && c <= '9';
}

static bool is_whitespace(const char c) {
    return c == ' '
        || c == '\n'
        || c == '\t';
}

static bool is_valid_character(const char c) {
    return is_whitespace(c)
        || c >= 32
        || c <= 126; 
}

static bool lexer_yield(regex_t *const regex, regoff_t *const offset, const char* const str, Token *const token) {
    regmatch_t regmatch[7 + 1]= {0};
    if(regexec(regex, str + *offset, ARRAY_COUNT(regmatch), regmatch, 0) != REG_NOMATCH) {
        *offset += regmatch[0].rm_eo;
        int8_t index = -1;
        for(int8_t i = 1; i < (int8_t)ARRAY_COUNT(regmatch); ++i) {
            if(regmatch[i].rm_so != -1 && regmatch[i].rm_eo != -1) {
                ASSERT(index == -1);
                index = i;
            }
        }
        return true;
    } else {
        ASSERT(*offset == (regoff_t)strlen(str) - 1);
        return false;   
    }
}

static void analyze_lexic(const char *const str) {
    static const char* lexer_patterns[] = {
        [TOKEN_TYPE_IDENTIFIER] = "([a-zA-Z!$%&*/:<=>?^_~][a-zA-Z!$%&*/:<=>?^_~0-9]*)|[+]|[-]",
        [TOKEN_TYPE_BOOLEAN] = "true|false",
        [TOKEN_TYPE_LPAREN] = "(",
        [TOKEN_TYPE_RPAREN] = ")",
        [TOKEN_TYPE_INTEGER] = "[+-]?[0-9]+",
        [TOKEN_TYPE_FLOAT] = "[+-]?[0-9]+[.][0-9]+",
        [TOKEN_TYPE_STRING] = "\"[^\"]\"",
    };
    size_t total_len = 0;
    for(uint8_t i = 0; i < ARRAY_COUNT(lexer_patterns); ++i) {
        total_len += strlen(lexer_patterns[i]);
    }
    total_len += ARRAY_COUNT(lexer_patterns) - 1;

    Token token = {0};
    regex_t regex;
    ASSERT(regcomp(&regex, "([(])|([)])|(true)|(false)|()|()|()", REG_EXTENDED) == 0);
    regoff_t offset = 0;
    while(lexer_yield(&regex, &offset, str)) {

    }

    
    LOG_DEBUG("len: %lu, offset: %d", len, offset);
}

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
    analyze_lexic(data);
    free(data);
}
