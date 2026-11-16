#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Reference: compares two floating-point numbers represented as uint64_t
    // by handling sign bits and magnitude ordering correctly.
    // Positive values: normal signed comparison.
    // Negative values: reversed order.
    // Mixed signs: negative is less than positive.
    int cc0, cc1;
    int64_t sx;
    int64_t sy;

    sx = *(int64_t *)&x;
    sy = *(int64_t *)&y;
    sy &= ~((sx ^ sy) >> 63); /* set sy=0 if signs differ */

    cc0 = (int)((sx - sy) >> 63) & 1; /* Neither subtraction overflows when */
    cc1 = (int)((sy - sx) >> 63) & 1; /* the signs are the same. */

    return cc0 ^ ((cc0 ^ cc1) & (int)((x & y) >> 63));
}


int main(){
    fpr_lt(0,0);
}
