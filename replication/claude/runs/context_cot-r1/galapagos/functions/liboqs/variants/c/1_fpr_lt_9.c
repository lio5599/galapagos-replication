#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Computes the result arithmetically from the sign bits and unsigned compares.
    // d = signs differ. In that case the answer is x's sign bit.
    // Same sign: the answer is [x<y] when non-negative and [y<x] when negative.
    // The terms are combined with masks, so exactly one case contributes. Equal inputs give 0.
    int sx = (int)(x >> 63);
    int d = (int)((x ^ y) >> 63);
    int same = (sx ? (y < x) : (x < y));
    return (d & sx) | ((d ^ 1) & same);
}


int main(){
    fpr_lt(0,0);
}
