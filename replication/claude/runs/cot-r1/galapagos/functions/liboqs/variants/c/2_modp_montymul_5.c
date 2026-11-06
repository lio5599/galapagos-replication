#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Keeps t = (uint32_t)((z+w)>>31) and the candidate d = t - p.
    // The reference adds p back when d has its top bit set, and (t - p) + p == t mod 2^32.
    // So returning t in that case and d otherwise is the same value.
    // This holds for all inputs, because the wraparound is modulo 2^32.
    uint64_t z, w;
    uint32_t t, d;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    t = (uint32_t)((z + w) >> 31);
    d = t - p;
    return (d >> 31) ? t : d;
}


int main(){
    modp_montymul(0,0,0,0);
}
