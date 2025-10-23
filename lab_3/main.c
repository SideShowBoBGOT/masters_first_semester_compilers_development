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
    TOKEN_TYPE_IDENTIFIER,
    TOKEN_TYPE_BOOLEAN,
    TOKEN_TYPE_LPAREN,
    TOKEN_TYPE_RPAREN,
    TOKEN_TYPE_INTEGER,
    TOKEN_TYPE_FLOAT,
    TOKEN_TYPE_STRING,
    TOKEN_TYPE_NEWLINE,
    TOKEN_TYPE_WHITESPACE,
} TokenType;

static const char* token_regex_map[] = {
    [TOKEN_TYPE_IDENTIFIER] = "[a-zA-Z!$%&*/:<=>?^_~][a-zA-Z!$%&*/:<=>?^_~0-9]*|[+]|[-]",
    [TOKEN_TYPE_BOOLEAN] = "true|false",
    [TOKEN_TYPE_LPAREN] = "[(]",
    [TOKEN_TYPE_RPAREN] = "[)]",
    [TOKEN_TYPE_INTEGER] = "[+-]?[0-9]+",
    [TOKEN_TYPE_FLOAT] = "[+-]?[0-9]+[.][0-9]+",
    [TOKEN_TYPE_STRING] = "\"[^\"]*\"",
    [TOKEN_TYPE_NEWLINE] = "\n",
    [TOKEN_TYPE_WHITESPACE] = "[ \t]+",
};

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

static void analyze_lexic(const char *const str) {
    regex_t regex;
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
        ASSERT(regcomp(&regex, regex_string, REG_EXTENDED) == 0);
        free(regex_string);
    }
    regoff_t offset = 0;
    regmatch_t regmatch[ARRAY_COUNT(token_regex_map) + 1] = {0};
    regoff_t newline_index = 0;
    regoff_t newline_offset = 0;
    static const uint8_t group_offset = 2;
    while(regexec(&regex, str + offset, ARRAY_COUNT(regmatch), regmatch, 0) != REG_NOMATCH) {
        // for debug puposes i want to be sure that token matches only for a single group
        bool group_found = false;
        for(uint8_t i = group_offset; i < (uint8_t)ARRAY_COUNT(regmatch); ++i) {
            if(regmatch[i].rm_so != -1 && regmatch[i].rm_eo != -1) {
                const TokenType token_type = (TokenType)i - group_offset;
                if(token_type == TOKEN_TYPE_NEWLINE) {
                    newline_index += 1;
                    newline_offset = offset;
                }
                ASSERT(group_found == false);
                group_found = true;
                const int token_len = regmatch[i].rm_eo - regmatch[i].rm_so;
                LOG_DEBUG("%.*s, %s", token_len, str + offset + regmatch[i].rm_so, token_type_str(token_type));
            }
        }
        offset += regmatch[0].rm_eo;
    }
    if(offset != (regoff_t)strlen(str)) {
        LOG_DEBUG("unrecognized input at %d:%d", newline_index, offset - newline_offset);
    }
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
