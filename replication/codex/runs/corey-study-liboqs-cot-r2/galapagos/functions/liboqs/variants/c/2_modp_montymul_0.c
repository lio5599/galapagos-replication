#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Computes a radix-2^31 Montgomery-style product with wraparound correction.
    // Only the low 31 bits of z times p0i contribute to the multiplier.
    // Explicit unsigned truncations preserve the reference for all inputs,
    // including overflowing sums and noncanonical Montgomery parameters.
    uint64_t z = (uint64_t)a * b;
    uint32_t m = (uint32_t)((z & 0x7FFFFFFFULL) * p0i)
        & 0x7FFFFFFFU;
    uint64_t w = (uint64_t)m * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & (0U - (d >> 31));
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
