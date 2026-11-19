#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Computes a Montgomery-style product with radix 2^31 and a sign-bit correction.
    // The 64-bit addition wraps before shifting, exactly as in the reference.
    // An explicit branch adds p precisely when the wrapped difference has bit 31 set.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;

    if ((d >> 31) != 0) {
        d += p;
    }
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
