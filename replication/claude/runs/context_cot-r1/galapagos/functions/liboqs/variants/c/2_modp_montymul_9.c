#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Same 64-bit Montgomery step as the reference, with m in 64 bits.
    // m keeps only the low 31 bits of z*p0i.
    // The top bit of d is extracted as a 0/1 flag.
    // d + (p & (0 - flag)) is the same as the reference's d + (p & -(d>>31)).
    uint64_t z, m, w;
    uint32_t d, flag;

    z = (uint64_t)a * (uint64_t)b;
    m = (z * (uint64_t)p0i) & (uint64_t)0x7FFFFFFF;
    w = m * (uint64_t)p;
    d = (uint32_t)((z + w) >> 31);
    d = d - p;
    flag = d >> 31;
    d = d + (p & (0u - flag));
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
