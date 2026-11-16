#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Bitwise approach without branches.
    // Compute sign bits.
    // If signs differ, return sx.
    // If same sign, use magnitude comparison with order adjustment.
    int sx = (x >> 63) & 1;
    int sy = (y >> 63) & 1;
    int signs_differ = sx ^ sy;
    int lt_pos = (x < y) & 1;
    int lt_neg = (x > y) & 1;
    return (signs_differ & sx) | ((~signs_differ) & (sx ? lt_neg : lt_pos));
}


int main(){
    fpr_lt(0,0);
}
