#include <stdint.h>

__attribute__((noinline))
int fpr_lt_6(uint64_t x, uint64_t y) {
    // Direct translation of IEEE 754 comparison rules to bitwise operations
    // Negative zero and positive zero are equal, handled by magnitude comparison
    // Infinity and NaN comparisons follow IEEE 754 total ordering convention
    // Sign bit determines overall ordering direction for same-sign operands
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    int sx_neg = (int)(x >> 63);
    int sy_neg = (int)(y >> 63);

    if (sx_neg && !sy_neg) return 1;
    if (!sx_neg && sy_neg) return 0;
    if (sx_neg) return sy < sx;
    return sx < sy;
}


int main(){
    fpr_lt_6(0,0);
}
