#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Multiplication by the top bit replaces the conditional correction mask.
    // That bit is exactly zero or one; the final cast preserves 32-bit wraparound.
    // The product, wrapped sum, and subtraction otherwise match the reference.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;

    return (uint32_t)((uint64_t)d + (uint64_t)p * (d >> 31));
}


int main(){
    modp_montymul(0,0,0,0);
}
