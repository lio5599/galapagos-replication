#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Reference: halves a double by decrementing its exponent, or returns +0 if exponent is 0.
    // Approach: test the 11-bit exponent field directly and branch with a ternary.
    // In the reference, the subtraction borrows into the exponent only when it is 0, giving 0x7FF.
    // That sets t=1 and clears x, so zero or subnormal input of either sign yields +0.
    // Otherwise only the exponent drops by one; sign and mantissa stay unchanged.
    uint32_t e = (uint32_t)(x >> 52) & 0x7FF;
    return e == 0 ? (uint64_t)0 : x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
