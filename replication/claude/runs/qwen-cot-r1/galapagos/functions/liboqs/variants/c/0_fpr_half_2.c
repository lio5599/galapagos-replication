#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: directly manipulate exponent bits by subtracting 1<<52.
    // Subtracting 1<<52 from x decrements the exponent by 1.
    // Then mask out mantissa if exponent underflows to 0.
    // Zero case: if original exponent was 0, x becomes negative-like, but masking handles it.
    // The mask t-1 becomes 0 when exponent was 0, zeroing the result.
    uint32_t t = (((uint32_t)(x >> 52) & 0x7FF) + 1) >> 11;
    x -= (uint64_t)1 << 52;
    x &= (uint64_t)t - 1;
    return x;
}


int main(){
    fpr_half(0);
}
