#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // z*p0i mod 2^31 depends only on the low 31 bits of p0i and of z.
    // So p0i is masked first and the product is computed in 32 bits, giving the same m.
    // The 64-bit sum z + m*p and the shift by 31 match the reference exactly.
    // The final correction uses the same mask-and-add as the reference.
    uint64_t z, w;
    uint32_t m, d;

    z = (uint64_t)a * (uint64_t)b;
    m = ((uint32_t)z * (p0i & 0x7FFFFFFFu)) & 0x7FFFFFFFu;
    w = (uint64_t)p * (uint64_t)m;
    d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
