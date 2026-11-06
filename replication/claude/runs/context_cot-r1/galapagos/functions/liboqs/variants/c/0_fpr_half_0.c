#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Reference: halves a double by decrementing the exponent field; returns 0 when exponent is 0.
    // After x -= 2^52 the exponent field is the old one minus 1 mod 2^11.
    // It equals 0x7FF only when the old exponent was 0 (zero or subnormal).
    // So test the original exponent directly: zero gives 0, else x - 2^52.
    // Inf/NaN (exp 0x7FF) become exp 0x7FE, the same as the reference.
    uint32_t e = (uint32_t)(x >> 52) & 0x7FF;
    return (e == 0) ? (uint64_t)0 : (x - ((uint64_t)1 << 52));
}


int main(){
    fpr_half(0);
}
