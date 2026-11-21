#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Splits p into two 16-bit limbs when computing the correction product.
    // The masked multiplier has at most 31 bits, so both terms and w fit.
    // The wrapping sum and final correction retain all reference edge cases.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t m = (z * p0i) & (uint64_t)0x7FFFFFFF;
    uint64_t w = m * (p & (uint32_t)0xFFFF)
        + ((m * (p >> 16)) << 16);
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
