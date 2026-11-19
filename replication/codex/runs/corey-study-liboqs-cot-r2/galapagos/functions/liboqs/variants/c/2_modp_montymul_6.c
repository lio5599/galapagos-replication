#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Builds a times b from four 16-bit partial products.
    // Their weighted sum is the exact 64-bit product for every input.
    // The remaining operations preserve the original truncations and
    // correction, including zero, maximal values, and wrapped sums.
    uint64_t a0 = a & 0xFFFFU;
    uint64_t a1 = a >> 16;
    uint64_t b0 = b & 0xFFFFU;
    uint64_t b1 = b >> 16;
    uint64_t z = a0 * b0 + ((a0 * b1 + a1 * b0) << 16)
        + ((a1 * b1) << 32);
    uint64_t w = ((z * p0i) & 0x7FFFFFFFULL) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & (0U - (d >> 31));
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
