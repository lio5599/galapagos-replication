#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Builds the correction mask by complementing high-bit-minus-one.
    // Truncation makes the mask zero or UINT32_MAX exactly as required.
    // The original wrapping sum and subtraction are preserved.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    uint32_t mask = (uint32_t)~(uint32_t)((d >> 31) - 1U);
    d += p & mask;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
