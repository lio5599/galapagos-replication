#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Computes a radix-2^31 Montgomery-style product with wrapped correction.
    // Naming the masked multiplier preserves every unsigned operation.
    // Both the 64-bit sum and 32-bit subtraction retain their wraparound.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t m = (z * p0i) & (uint64_t)0x7FFFFFFF;
    uint64_t w = m * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
