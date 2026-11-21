#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Decrement the exponent modulo 2048 while preserving sign and fraction.
    // Multiply by the original exponent's nonzero flag to clear the wrapped case.
    // For nonzero exponents this is exactly subtraction, even for infinity or NaN.
    // For zero exponents the entire result becomes zero, regardless of its other bits.
    uint64_t e = (x >> 52) & UINT64_C(0x7FF);
    uint64_t decremented = (e + UINT64_C(2047)) & UINT64_C(0x7FF);
    uint64_t y = (x & UINT64_C(0x800FFFFFFFFFFFFF)) | (decremented << 52);
    return y * (uint64_t)(e != 0);
}


int main(){
    fpr_half(0);
}
