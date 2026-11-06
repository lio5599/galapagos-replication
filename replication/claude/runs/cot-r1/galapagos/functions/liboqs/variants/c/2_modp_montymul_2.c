#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Bits 31..62 of z+w are computed by splitting each term at bit 31.
    // The high parts are added plus the carry from adding the low 31-bit parts.
    // Truncating to 32 bits equals (uint32_t)((z+w)>>31), even if z+w wraps 2^64,
    // because any wrap affects only bits that the truncation discards.
    // The final conditional add of p is the same as in the reference.
    uint64_t z, w, carry;
    uint32_t t, d;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    carry = ((z & 0x7FFFFFFFu) + (w & 0x7FFFFFFFu)) >> 31;
    t = (uint32_t)((z >> 31) + (w >> 31) + carry);
    d = t - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
