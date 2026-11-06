#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Bits 31..62 of s = z+w are extracted as ((s << 1) >> 32).
    // The left shift drops bit 63, and the right shift drops bits 0..30.
    // That leaves exactly the 32 bits that (uint32_t)(s >> 31) keeps.
    // The rest of the computation is the same as the reference.
    uint64_t z, w, s;
    uint32_t d;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    s = z + w;
    d = (uint32_t)((s << 1) >> 32) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
