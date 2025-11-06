#include <stdio.h>

extern int my_function(int a, int b);

int main(void) {
    printf("ahaha %d\n", my_function(11, 12));
}
