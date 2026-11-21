#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Adding 2047 to an 11-bit exponent yields a carry exactly when it is nonzero.
    // Expanding that carry masks the decremented word or clears it entirely.
    // Zero exponents clear for either sign; all other bit patterns subtract 2^52.
    uint64_t e = (x >> 52) & UINT64_C(0x7FF);
    uint64_t keep = (e + UINT64_C(2047)) >> 11;
    return (x - (UINT64_C(1) << 52)) & (UINT64_C(0) - keep);
}


int main(){
    fpr_half(0);
}
