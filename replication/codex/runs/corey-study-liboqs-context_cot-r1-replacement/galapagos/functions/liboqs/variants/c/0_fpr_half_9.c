#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Adding 2047 to the original 11-bit exponent crosses 2048 iff it is nonzero.
    // Shifting therefore yields exactly zero or one, with no overflow.
    // Its unsigned negation masks the subtraction exactly as the reference does.
    uint64_t e = (x >> 52) & 0x7FF;
    uint64_t keep = (e + (uint64_t)2047) >> 11;
    return (x - ((uint64_t)1 << 52)) & ((uint64_t)0 - keep);
}


int main(){
    fpr_half(0);
}
