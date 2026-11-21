#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Computes the reference's radix-2^31 Montgomery-style reduction.
    // Only the low 31 bits of p0i affect the masked product.
    // Unsigned wrapping and the high-bit-based correction remain unchanged.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t w = ((z * (p0i & (uint32_t)0x7FFFFFFF))
        & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
