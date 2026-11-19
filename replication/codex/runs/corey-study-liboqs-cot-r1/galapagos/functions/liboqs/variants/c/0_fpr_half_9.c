#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // For nonzero exponents, decrementing the field preserves sign and fraction.
    // Reassemble those fields explicitly instead of subtracting from the input.
    // Handle exponent zero first; maximal exponents are decremented normally.
    uint64_t e = (x >> 52) & 0x7FF;
    uint64_t exponent_mask = (uint64_t)0x7FF << 52;
    if (e == 0) {
        return 0;
    }
    return (x & ~exponent_mask) | ((e - (uint64_t)1) << 52);
}


int main(){
    fpr_half(0);
}
