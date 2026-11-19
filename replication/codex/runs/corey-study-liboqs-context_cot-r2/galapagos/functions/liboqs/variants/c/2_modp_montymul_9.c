#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Split p into 16-bit limbs when forming the correction product.
    // The masked multiplier is below 2^31, so reconstruction is exact in 64 bits.
    // The subsequent 64-bit sum still wraps before shifting, as in the reference.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t m = (z * p0i) & (uint64_t)0x7FFFFFFF;
    uint64_t lo = m * (p & (uint32_t)0xFFFF);
    uint64_t hi = m * (p >> 16);
    uint64_t w = lo + (hi << 16);
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
