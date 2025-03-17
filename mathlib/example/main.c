#include <stdio.h>
#include "mathlib.h"

int main() {
    int a = 5, b = 3;
    printf("add(%d, %d) = %d\n", a, b, add(a, b));
    printf("sub(%d, %d) = %d\n", a, b, sub(a, b));
    return 0;
}
