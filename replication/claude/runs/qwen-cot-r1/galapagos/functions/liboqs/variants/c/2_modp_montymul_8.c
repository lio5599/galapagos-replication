#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Alternative formulation using the same mathematical foundation.
    // The key insight is that Montgomery multiplication maps (a,b) to (a*b*R^-1) mod p.
    // With R=2^31, the reduction uses p0i to compute a correction term w = m*p.
    // The sum z+w is divisible by R, so shifting right by 31 gives the quotient.
    // Final reduction modulo p is done via comparison and subtraction, equivalent to reference.
    uint64_t z, w;
    uint32_t m, d;

    z = (uint64_t)a * (uint64_t)b;
    m = (uint32_t)(z * p0i);
    w = (uint64_t)m * p;
    d = (uint32_t)((z + w) >> 31);
    d -= (d >= p) ? p : 0;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
