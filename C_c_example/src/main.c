#include <stdio.h>
#include "mathlib.h"
#include "zigmath.h"

int main() {
    int a = 10, b = 5;
    printf("[c]   Add: %d + %d = %d\n", a, b, add(a, b));
    printf("[c]   Sub: %d - %d = %d\n", a, b, sub(a, b));
    printf("[zig] Mul: %d * %d = %d\n", a, b, mul(a, b));
    return 0;
}
