#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Alternative using arithmetic right shift for sign detection
    // Uses the fact that arithmetic right shift preserves sign bit
    // to create a mask that is all 1s when result is negative
    uint64_t z, w;
    uint32_t d;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    d = (uint32_t)((z + w) >> 31) - p;
    uint32_t mask = (uint32_t)((int32_t)d >> 31);
    d += p & mask;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
