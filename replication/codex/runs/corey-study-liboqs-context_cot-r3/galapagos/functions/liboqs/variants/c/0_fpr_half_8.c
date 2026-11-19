#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // The exponent is at most 2047, so its unsigned negation has bit 63 set
    // exactly when the exponent is nonzero.
    // Expand that bit to a mask; zero exponents clear all sign and fraction bits.
    uint64_t exponent = (x >> 52) & 0x7FF;
    uint64_t keep = (exponent | ((uint64_t)0 - exponent)) >> 63;
    uint64_t y = x - ((uint64_t)1 << 52);
    return y & ((uint64_t)0 - keep);
}


int main(){
    fpr_half(0);
}
