#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Select between d and its wrapped sum with p using the high bit of d.
    // This is the same conditional addition as the reference's mask operation.
    // Neither candidate relies on a modulus bound or on absence of overflow.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    uint32_t corrected = d + p;
    uint32_t mask = 0U - (d >> 31);
    return (d & ~mask) | (corrected & mask);
}


int main(){
    modp_montymul(0,0,0,0);
}
