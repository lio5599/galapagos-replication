#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t w = z * p0i;

    w &= UINT64_C(0x7FFFFFFF);
    w *= p;
    z += w;
    z >>= 31;

    uint32_t d = (uint32_t)z - p;
    uint32_t correction[2] = { UINT32_C(0), p };

    return d + correction[d >> 31];
}


int main(){
    modp_montymul(0,0,0,0);
}
