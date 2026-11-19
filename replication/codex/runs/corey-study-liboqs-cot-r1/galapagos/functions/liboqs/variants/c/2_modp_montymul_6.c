#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Reduce both multiplier operands modulo 2^31 before multiplying.
    // Only their low 31 bits can affect the reference's masked product.
    // The remaining sum, truncation, and correction preserve all wrap cases.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t m = ((z & (uint64_t)0x7FFFFFFF)
        * (p0i & (uint32_t)0x7FFFFFFF)) & (uint64_t)0x7FFFFFFF;
    uint64_t sum = z + m * p;
    uint32_t d = (uint32_t)(sum >> 31) - p;
    return d + (p & (uint32_t)(0u - (d >> 31)));
}


int main(){
    modp_montymul(0,0,0,0);
}
