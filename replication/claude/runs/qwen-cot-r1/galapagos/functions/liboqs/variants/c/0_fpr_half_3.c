#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: compute new exponent by decrementing, then apply mask.
    // Extract exponent, decrement via (exp+1)>>11 trick.
    // Subtract 1<<52 to adjust for implicit bit, then mask mantissa.
    // When exponent is 0, t=0, mask is -1 which is all 1s, but x was reduced.
    // Actually, t=0 gives mask -1, but x after subtraction has high bits cleared.
    uint32_t exp = (uint32_t)(x >> 52) & 0x7FF;
    uint32_t t = (exp + 1) >> 11;
    x -= (uint64_t)1 << 52;
    x &= (uint64_t)t - 1;
    return x;
}


int main(){
    fpr_half(0);
}
