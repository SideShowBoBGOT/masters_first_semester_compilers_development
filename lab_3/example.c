#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

extern int64_t fn_19(int64_t val);
extern int64_t fn_20(int64_t a, int64_t b);

int main(void) {
    printf("factorial %d\n", fn_19(10));
    printf("pow %d\n", fn_20(3, 3));
}
