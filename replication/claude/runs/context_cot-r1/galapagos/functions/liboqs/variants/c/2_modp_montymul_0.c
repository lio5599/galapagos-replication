#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Computes the Montgomery product a*b/2^31 mod p, with a final conditional add of p.
    // Approach: the reference code, with intermediate values renamed and steps split up.
    // z holds the full 64-bit product, and w = (z*p0i mod 2^31)*p.
    // The sum z+w wraps mod 2^64 exactly as in the reference.
    // d = bits 31..62 of that sum minus p, mod 2^32.
    // p is added back when bit 31 of d is set, using a mask.
    uint64_t prod, corr, sum;
    uint32_t r;

    prod = (uint64_t)a * (uint64_t)b;
    corr = ((prod * p0i) & (uint64_t)0x7FFFFFFF) * p;
    sum = prod + corr;
    r = (uint32_t)(sum >> 31) - p;
    r += p & -(r >> 31);
    return r;
}


int main(){
    modp_montymul(0,0,0,0);
}
