#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Propagate any set exponent bit down to bit zero to obtain a nonzero flag.
    // Its negation keeps the subtraction exactly for nonzero original exponents.
    // Zero exponents clear both signs and every fraction, as in the reference.
    uint64_t e = (x >> 52) & UINT64_C(0x7FF);
    e |= e >> 8;
    e |= e >> 4;
    e |= e >> 2;
    e |= e >> 1;
    return (x - (UINT64_C(1) << 52))
        & (UINT64_C(0) - (e & UINT64_C(1)));
}


int main(){
    fpr_half(0);
}
