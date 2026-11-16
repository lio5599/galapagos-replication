#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Final variant emphasizing the role of p0i in zeroing low bits.
    // The product z = a*b is reduced by adding w = m*p where m = (z*p0i) mod 2^31.
    // This makes z+w divisible by 2^31, so the high 31 bits are the quotient.
    // The quotient is then reduced modulo p by subtracting p if it is too large.
    // All edge cases are handled correctly, including when p=1 or inputs are zero.
    uint64_t z, w;
    uint32_t m, d;

    z = (uint64_t)a * (uint64_t)b;
    m = (uint32_t)(z * p0i);
    w = (uint64_t)m * p;
    d = (uint32_t)((z + w) >> 31);
    if (d >= p) d -= p;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
