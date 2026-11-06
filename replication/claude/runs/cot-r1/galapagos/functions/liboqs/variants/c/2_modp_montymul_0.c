#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Computes Montgomery product a*b/2^31 mod p (p odd < 2^31, p0i = -1/p mod 2^31).
    // Same arithmetic as the reference, but the final correction uses a branch.
    // d = t - p has its top bit set exactly when the reference mask is all ones.
    // In that case p is added, otherwise d is kept, matching d += p & -(d >> 31).
    // All operations are bit-identical for every input, including out-of-range ones.
    uint64_t z, w;
    uint32_t d;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    d = (uint32_t)((z + w) >> 31) - p;
    if (d & 0x80000000u) {
        d += p;
    }
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
