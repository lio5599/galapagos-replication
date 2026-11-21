#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Split b into its low 31 bits and its single high bit.
    // The two terms reconstruct a*b exactly without intermediate overflow.
    // The original reduction and correction preserve all boundary cases.
    uint64_t z = (uint64_t)a * (b & UINT32_C(0x7FFFFFFF));
    z += ((uint64_t)a * (b >> 31)) << 31;
    uint64_t w = ((z * p0i) & UINT64_C(0x7FFFFFFF)) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
