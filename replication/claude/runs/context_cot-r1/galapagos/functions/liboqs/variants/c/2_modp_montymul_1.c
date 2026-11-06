#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // The reference keeps only the low 31 bits of z*p0i.
    // Those bits depend only on the low 32 bits of z and of p0i.
    // So m = ((uint32_t)z * p0i) & 0x7FFFFFFF is computed in 32-bit arithmetic.
    // w = (uint64_t)m*p is identical, and the 64-bit wrap of z+w is unchanged.
    // The final correction uses the same mask trick.
    uint64_t z, w;
    uint32_t m, d;

    z = (uint64_t)a * (uint64_t)b;
    m = ((uint32_t)z * p0i) & 0x7FFFFFFFu;
    w = (uint64_t)m * (uint64_t)p;
    d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
