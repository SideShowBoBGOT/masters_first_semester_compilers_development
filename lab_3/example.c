#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

// extern int64_t fn_19(int64_t val);
extern int64_t fn_19(int64_t var1, int64_t var2, int64_t var3, int64_t var4,int64_t var5,int64_t var6,int64_t var7,int64_t var8,int64_t var9,int64_t num,int64_t var10, int64_t var11, int64_t var12, int64_t var13, int64_t var14, int64_t var15);
extern int64_t fn_20(int64_t a, int64_t b);

int main(void) {
    printf("factorial %d\n", fn_19(0, 0, 0, 0, 0, 0, 0, 0, 1, 10, 2, 99, 87, 111, 222, 3333));
    printf("pow %d\n", fn_20(2, 8));
}
