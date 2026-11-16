#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Halves positive IEEE 754 double by decrementing exponent.
    // Use conditional move logic via arithmetic.
    // Compute result as if decrementing always.
    // Zero out result if exponent was 0 or 1.
    // Mask computed from exponent comparison.
    uint64_t exp = (x >> 52) & 0x7FF;
    uint64_t result = x - ((uint64_t)1 << 52);
    uint64_t zero_mask = -(exp <= 1);
    return result & ~zero_mask;
}


int main(){
    fpr_half(0);
}
