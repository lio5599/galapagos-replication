#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Multiply p by the correction bit instead of masking p.
    // That bit is zero or one, so the added value is exactly zero or p.
    // The final conversion preserves wrapping even at the 32-bit boundary.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    return (uint32_t)((uint64_t)d + (uint64_t)(d >> 31) * p);
}


int main(){
    modp_montymul(0,0,0,0);
}
