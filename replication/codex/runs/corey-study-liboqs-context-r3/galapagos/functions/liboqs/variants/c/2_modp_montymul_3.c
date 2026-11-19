#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint32_t q = (uint32_t)(z * p0i) & UINT32_C(0x7FFFFFFF);
    uint64_t sum = z + (uint64_t)q * p;
    uint32_t d = (uint32_t)(sum >> 31) - p;
    uint32_t mask = UINT32_C(0) - (d >> 31);
    return d + (p & mask);
}


int main(){
    modp_montymul(0,0,0,0);
}
