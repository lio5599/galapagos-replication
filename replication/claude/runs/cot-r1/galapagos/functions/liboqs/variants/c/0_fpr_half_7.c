#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: inspect only the high 32-bit word, which holds sign and exponent.
    // Bits 20..30 of that word are the exponent; if they are all zero, return +0.
    // Otherwise subtract 2^52, which only decrements the exponent, as in the reference.
    uint32_t hi = (uint32_t)(x >> 32);
    if ((hi & 0x7FF00000u) == 0)
        return 0;
    return x - (uint64_t)0x0010000000000000;
}


int main(){
    fpr_half(0);
}
