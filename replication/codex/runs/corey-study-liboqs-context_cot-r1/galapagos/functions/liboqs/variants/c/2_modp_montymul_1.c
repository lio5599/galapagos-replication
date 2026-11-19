#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Only the low 31 bits of z times p0i affect w.
    // Truncating z and the product to 32 bits therefore preserves those bits.
    // The 64-bit sum and final unsigned correction retain all edge-case wrapping.
    uint64_t z = (uint64_t)a * b;
    uint32_t m = (uint32_t)z;
    m = (uint32_t)((uint64_t)m * p0i);
    m &= 0x7FFFFFFFU;
    uint64_t w = (uint64_t)m * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    return d + (p & (0U - (d >> 31)));
}


int main(){
    modp_montymul(0,0,0,0);
}
