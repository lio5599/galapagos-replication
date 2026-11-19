#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Splits the sum at bit 31 and explicitly carries its low-part sum.
    // Only the low 32 bits of the shifted result are needed.
    // Overflow at bit 64 cannot affect those bits, so this also matches
    // the reference when its 64-bit addition wraps.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & 0x7FFFFFFFULL) * p;
    uint64_t low = (z & 0x7FFFFFFFULL) + (w & 0x7FFFFFFFULL);
    uint32_t t = (uint32_t)((z >> 31) + (w >> 31) + (low >> 31));
    uint32_t d = t - p;
    return (uint32_t)(d + (p & (0U - (d >> 31))));
}


int main(){
    modp_montymul(0,0,0,0);
}
