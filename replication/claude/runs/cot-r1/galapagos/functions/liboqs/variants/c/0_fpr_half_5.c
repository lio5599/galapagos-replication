#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: detect a zero exponent via borrow into bit 63.
    // (x & EXP) - 1 wraps to all ones only when the exponent bits are 0; otherwise it is below 2^63.
    // Shifting right by 63 gives z=1 for exponent 0, so mask z-1 is 0 there.
    // When the exponent is nonzero, z-1 is all ones and x - 2^52 is returned unchanged.
    uint64_t z = ((x & (uint64_t)0x7FF0000000000000) - 1) >> 63;
    return (x - ((uint64_t)1 << 52)) & (z - 1);
}


int main(){
    fpr_half(0);
}
