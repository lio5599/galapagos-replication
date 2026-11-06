#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // x = (uint32_t)((z+w)>>31) is computed as in the reference, then d = x - p.
    // The result is d plus p if bit 31 of d is set, else d.
    // Masks are applied to both candidates: (d & ~mask) | ((d+p) & mask).
    // This selects the same value as d + (p & mask).
    uint64_t z, w;
    uint32_t x, d, mask;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    x = (uint32_t)((z + w) >> 31);
    d = x - p;
    mask = -(d >> 31);
    d = (d & ~mask) | ((d + p) & mask);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
