#include <stdint.h>

__attribute__((noinline))
int fpr_lt_2(uint64_t x, uint64_t y) {
    // Extract sign bits and use conditional logic based on sign agreement
    // If signs differ, result is simply sign of x (negative x is less)
    // If signs same, compare magnitudes using signed subtraction without overflow
    // When both negative, larger magnitude means smaller value, so reverse comparison
    int sx_sign = (x >> 63) & 1;
    int sy_sign = (y >> 63) & 1;
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;

    if (sx_sign != sy_sign) {
        return sx_sign;
    }
    if (sx_sign == 0) {
        return sx < sy;
    }
    return sy < sx;
}


int main(){
    fpr_lt_2(0,0);
}
