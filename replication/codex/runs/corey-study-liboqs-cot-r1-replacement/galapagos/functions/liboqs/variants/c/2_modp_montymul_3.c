#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Split a into two 16-bit limbs to reconstruct the exact 64-bit product.
    // Both partial products and their sum fit, including maximum inputs.
    // The reduction retains the reference's 64-bit wrap and 32-bit correction.
    uint64_t lo = (uint64_t)(a & UINT32_C(0xFFFF)) * b;
    uint64_t hi = (uint64_t)(a >> 16) * b;
    uint64_t z = lo + (hi << 16);
    uint64_t w = ((z * p0i) & UINT64_C(0x7FFFFFFF)) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
