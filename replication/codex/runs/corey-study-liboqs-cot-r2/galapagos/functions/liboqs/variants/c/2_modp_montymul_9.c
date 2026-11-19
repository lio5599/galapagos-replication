#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Splits p into 16-bit limbs and adds the two weighted products to z.
    // Unsigned addition is associative modulo 2^64, so separate additions
    // reproduce the original sum even when either addition wraps.
    // The shift, truncation, and top-bit correction remain identical.
    uint64_t z = (uint64_t)a * b;
    uint64_t m = (z * p0i) & 0x7FFFFFFFULL;
    uint64_t sum = z + m * (p & 0xFFFFU);
    sum += (m * (p >> 16)) << 16;
    uint32_t d = (uint32_t)(sum >> 31) - p;
    d += p & (0U - (d >> 31));
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
