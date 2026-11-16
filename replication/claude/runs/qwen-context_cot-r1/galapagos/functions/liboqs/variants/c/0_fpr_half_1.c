#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Halves positive IEEE 754 double by decrementing exponent.
    // Extract exponent, decrement, check for underflow to zero.
    // If original exponent was 0 or 1, result is zero.
    // Otherwise, keep mantissa bits unchanged.
    // Uses mask to zero out result if exponent underflows.
    uint64_t exp = (x >> 52) & 0x7FF;
    uint64_t mant = x & ((1ULL << 52) - 1);
    if (exp <= 1) return 0;
    return ((exp - 1) << 52) | mant;
}


int main(){
    fpr_half(0);
}
