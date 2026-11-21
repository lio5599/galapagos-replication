#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Test the original exponent instead of detecting its wrapped decrement.
    // A zero exponent produces zero regardless of the sign or fraction.
    // Every other exponent, including 0x7FF, requires exactly one subtraction.
    return (x & UINT64_C(0x7FF0000000000000))
        ? x - (UINT64_C(1) << 52)
        : UINT64_C(0);
}


int main(){
    fpr_half(0);
}
