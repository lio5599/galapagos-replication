#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // For the 11-bit exponent, e OR its unsigned negation has bit 63 set iff e is nonzero.
    // Negating that extracted bit produces the required all-ones or zero mask.
    // Thus zero exponents clear every bit and other inputs retain the subtraction.
    uint64_t e = (x >> 52) & 0x7FF;
    uint64_t nonzero = (e | ((uint64_t)0 - e)) >> 63;
    uint64_t mask = (uint64_t)0 - nonzero;
    return (x - ((uint64_t)1 << 52)) & mask;
}


int main(){
    fpr_half(0);
}
