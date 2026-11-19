#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Computes a radix-2^31 Montgomery-style product with the reference correction.
    // Naming the masked multiplier separately leaves every operation unchanged.
    // The same unsigned wrapping and bit-31 test apply for all input values.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t m = (z * p0i) & (uint64_t)0x7FFFFFFF;
    uint64_t w = m * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & (uint32_t)(0u - (d >> 31));
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
