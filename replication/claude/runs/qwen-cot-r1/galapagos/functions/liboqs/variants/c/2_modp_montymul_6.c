#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Uses the same core logic but writes the final adjustment with ternary operator.
    // The Montgomery multiplication computes (a*b*R^-1) mod p with R=2^31.
    // The intermediate w ensures z+w is a multiple of R, so division by R is exact.
    // The result after shift is in [0, 2p-1], so one subtraction suffices to reduce mod p.
    // Edge cases like a=0 or b=0 yield z=0, w=0, d=0, which is correct.
    uint64_t z, w;
    uint32_t d;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    d = (uint32_t)((z + w) >> 31);
    return (d >= p) ? d - p : d;
}


int main(){
    modp_montymul(0,0,0,0);
}
