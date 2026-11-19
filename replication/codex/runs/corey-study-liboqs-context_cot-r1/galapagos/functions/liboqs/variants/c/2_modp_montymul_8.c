#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Split p into 16-bit limbs when multiplying the masked coefficient.
    // Recombination is exact because the coefficient has at most 31 bits.
    // The potentially overflowing sum with z still wraps at 64 bits.
    uint64_t z = (uint64_t)a * b;
    uint64_t m = (z * p0i) & (uint64_t)0x7FFFFFFF;
    uint64_t low = m * (p & 0xFFFFU);
    uint64_t high = m * (p >> 16);
    uint64_t w = low + (high << 16);
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    return d + (p & (0U - (d >> 31)));
}


int main(){
    modp_montymul(0,0,0,0);
}
