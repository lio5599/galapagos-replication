#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Forms the low 31 bits of z times p0i using 16-bit partial products.
    // The omitted high-times-high term is divisible by 2^32 and irrelevant.
    // Masking yields the same multiplier even when the original product
    // overflows; the remaining arithmetic and correction are unchanged.
    uint64_t z = (uint64_t)a * b;
    uint64_t x0 = z & 0xFFFFULL;
    uint64_t x1 = (z >> 16) & 0xFFFFULL;
    uint64_t y0 = p0i & 0xFFFFU;
    uint64_t y1 = p0i >> 16;
    uint64_t m = (x0 * y0 + ((x0 * y1 + x1 * y0) << 16))
        & 0x7FFFFFFFULL;
    uint64_t w = m * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & (0U - (d >> 31));
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
