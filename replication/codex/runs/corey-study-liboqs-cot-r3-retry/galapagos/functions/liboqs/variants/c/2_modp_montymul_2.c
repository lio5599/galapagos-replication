#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Reduce both factors modulo 2^31 before computing the correction factor.
    // Discarded bits cannot affect the low 31 product bits, even on overflow.
    // The remaining operations retain the reference's exact wraparound behavior.
    uint64_t z = (uint64_t)a * b;
    uint64_t q = ((z & (uint64_t)0x7FFFFFFF)
        * (p0i & (uint32_t)0x7FFFFFFF)) & (uint64_t)0x7FFFFFFF;
    uint64_t w = q * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;

    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
