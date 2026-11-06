#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Dispatch on the 2-bit sign pair (sign of x, sign of y).
    // 0,0: both non-negative, so the unsigned order applies.
    // 0,1: y is negative and x is not, so the result is 0. 1,0: the result is 1.
    // 1,1: both negative, so the order reverses to x > y; equal inputs give 0.
    switch ((unsigned)(((x >> 63) << 1) | (y >> 63))) {
    case 0: return x < y;
    case 1: return 0;
    case 2: return 1;
    default: return x > y;
    }
}


int main(){
    fpr_lt(0,0);
}
