#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // The shift by 31 is split into a shift by 1 then a shift by 30.
    // For an unsigned 64-bit value this is identical to >>31.
    // m is computed in 32 bits, which is valid because only its low 31 bits are kept.
    // The correction is the reference mask written with p first.
    uint64_t z, s;
    uint32_t m, d;

    z = (uint64_t)a * (uint64_t)b;
    m = (p0i * (uint32_t)z) & 0x7FFFFFFFu;
    s = z + (uint64_t)p * (uint64_t)m;
    d = (uint32_t)((s >> 1) >> 30);
    d -= p;
    d += -(d >> 31) & p;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
