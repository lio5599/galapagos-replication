#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Compute a*b by adding the shifted terms selected by b's bits.
    // Shifts range from zero to 31, and every partial sum fits in 64 bits.
    // This includes zero and maximal operands; reduction remains unchanged.
    uint64_t z = 0;
    uint64_t w;
    uint32_t d;
    unsigned int i;
    for (i = 0; i < 32; ++i) {
        if ((b >> i) & 1u) {
            z += (uint64_t)a << i;
        }
    }
    w = ((z * p0i) & UINT64_C(0x7FFFFFFF)) * p;
    d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
