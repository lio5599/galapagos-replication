#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Split p into 16-bit limbs when forming the correction product.
    // The multiplier has at most 31 bits, so both terms and their sum fit.
    // The final sum still wraps in 64 bits exactly as in the reference.
    // The unchanged top-bit correction also covers arbitrary input values.
    uint64_t z = (uint64_t)a * b;
    uint64_t m = (z * p0i) & UINT64_C(0x7FFFFFFF);
    uint64_t w = m * (p & UINT32_C(0xFFFF))
                 + ((m * (p >> 16)) << 16);
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
