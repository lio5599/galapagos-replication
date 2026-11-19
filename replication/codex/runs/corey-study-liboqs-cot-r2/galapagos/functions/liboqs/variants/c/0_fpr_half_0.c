#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // The reference returns zero when exponent bits 52..62 are zero, otherwise x minus 2^52.
    // Test those bits before subtraction, preserving the exact unsigned behavior.
    // Every zero-exponent input, including signed zeros and subnormals, returns zero.
    // All other bit patterns, including infinities and NaNs, undergo subtraction.
    if (((x >> 52) & 0x7FF) == 0)
        return 0;
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
