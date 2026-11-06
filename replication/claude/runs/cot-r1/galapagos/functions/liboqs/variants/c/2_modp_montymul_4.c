#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // The mask is built as ~((d >> 31) - 1) instead of -(d >> 31).
    // If the sign bit is 1: 1 - 1 = 0, and ~0 is all ones.
    // If the sign bit is 0: 0 - 1 wraps to all ones, and its complement is 0.
    // So the mask, and therefore the result, is identical to the reference.
    uint64_t z, w;
    uint32_t d, mask;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    d = (uint32_t)((z + w) >> 31) - p;
    mask = ~((d >> 31) - 1u);
    d += p & mask;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
