#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Use arithmetic on sign-extended values.
    // When signs same, subtraction does not overflow.
    // Use sign of difference with order correction for negatives.
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    int xs = (sx >> 63) & 1;
    int ys = (sy >> 63) & 1;
    if (xs != ys) return xs;
    int diff = sx - sy;
    int sgn = (diff >> 63) & 1;
    return xs ? (1 - sgn) : sgn;
}


int main(){
    fpr_lt(0,0);
}
