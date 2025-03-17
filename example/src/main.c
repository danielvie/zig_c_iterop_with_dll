#include <stdio.h>
#include "mathlib.h"
#include "zigmath.h"

int main() {
    int a = 10, b = 5;
    printf("Add: %d + %d = %d\n", a, b, add(a, b));
    printf("Subtract: %d - %d = %d\n", a, b, sub(a, b));
    printf("Multiply: %d * %d = %d\n", a, b, mul(a, b));
    return 0;
}