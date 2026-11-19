#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Form a times b by splitting a into its two 16-bit limbs.
    // Both partial products and their sum fit in 64 bits for all 32-bit inputs.
    // The remaining reduction and wraparound correction are unchanged.
    uint64_t low = (uint64_t)(a & (uint32_t)0xFFFF) * b;
    uint64_t high = (uint64_t)(a >> 16) * b;
    uint64_t z = low + (high << 16);
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;

    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
