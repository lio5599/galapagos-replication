#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Computes the reference's radix-2^31 reduction and bit-31-controlled correction.
    // A branch replaces the correction mask, testing the same wrapped difference.
    // Unsigned wraparound is preserved, including for unrestricted input values.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;

    if (d >> 31) {
        d = (uint32_t)((uint64_t)d + p);
    }
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
