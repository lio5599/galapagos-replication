#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: use arithmetic to decrement exponent without branching.
    // The expression (exp + 1) >> 11 gives 0 if exp==0, else exp-1.
    // Subtract 1<<52 to adjust exponent, then mask mantissa with t-1.
    // When t=0, mask is all 1s but x has been reduced so high bits are 0.
    // This ensures zero case returns 0.
    uint32_t t = (((uint32_t)(x >> 52) & 0x7FF) + 1) >> 11;
    x -= (uint64_t)1 << 52;
    x &= (uint64_t)t - 1;
    return x;
}


int main(){
    fpr_half(0);
}
