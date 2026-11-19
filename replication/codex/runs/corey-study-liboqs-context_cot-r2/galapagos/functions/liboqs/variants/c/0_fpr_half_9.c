#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Subtracting 2^52 subtracts 2^20 from the upper word and leaves the lower word.
    // Test the original exponent in the upper word to clear every zero-exponent input.
    // For nonzero exponents there is no borrow into the sign bit.
    uint32_t hi = (uint32_t)(x >> 32);
    uint32_t lo = (uint32_t)x;
    if ((hi & (uint32_t)0x7FF00000) == 0)
        return 0;
    hi -= (uint32_t)0x00100000;
    return ((uint64_t)hi << 32) | (uint64_t)lo;
}


int main(){
    fpr_half(0);
}
