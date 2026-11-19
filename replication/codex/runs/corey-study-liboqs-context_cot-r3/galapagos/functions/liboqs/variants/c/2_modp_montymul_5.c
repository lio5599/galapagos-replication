#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Only the low 31 bits of each factor can affect their product modulo 2^31.
    // Masking both factors first therefore preserves w for every input.
    // The masked product fits in 64 bits; subsequent wrapping remains unchanged.
    uint64_t mask = (uint64_t)0x7FFFFFFF;
    uint64_t z = (uint64_t)a * b;
    uint64_t m = ((z & mask) * ((uint64_t)p0i & mask)) & mask;
    uint64_t w = m * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;

    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
