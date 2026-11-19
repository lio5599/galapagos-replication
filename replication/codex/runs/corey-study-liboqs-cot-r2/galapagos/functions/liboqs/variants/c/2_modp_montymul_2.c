#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Multiplies p by the correction bit instead of masking p.
    // The bit is always zero or one, so the added value is identical.
    // All truncations and unsigned wraparound match the reference,
    // including inputs outside the usual Montgomery bounds.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & 0x7FFFFFFFULL) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    uint32_t correction = (uint32_t)((uint64_t)p * (d >> 31));
    return (uint32_t)(d + correction);
}


int main(){
    modp_montymul(0,0,0,0);
}
