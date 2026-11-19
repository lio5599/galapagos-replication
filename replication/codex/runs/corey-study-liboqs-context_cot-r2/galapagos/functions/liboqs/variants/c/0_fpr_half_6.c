#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // For the eleven-bit exponent, e OR its unsigned negation has its top bit
    // set exactly when e is nonzero. Expand that bit into a full-width mask.
    // Zero exponents are cleared; all other inputs retain the reference subtraction.
    uint64_t e = (x >> 52) & (uint64_t)0x7FF;
    uint64_t keep = (e | ((uint64_t)0 - e)) >> 63;
    return (x - ((uint64_t)1 << 52)) & ((uint64_t)0 - keep);
}


int main(){
    fpr_half(0);
}
