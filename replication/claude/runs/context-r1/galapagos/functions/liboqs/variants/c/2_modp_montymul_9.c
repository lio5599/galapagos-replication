#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint32_t t = (uint32_t)(z * (uint64_t)p0i) & 0x7FFFFFFFu;
    uint64_t s = (uint64_t)t * (uint64_t)p + z;
    uint32_t d = (uint32_t)(s >> 31) - p;

    return d + (p & (~(d >> 31) + 1u));
}


int main(){
    modp_montymul(0,0,0,0);
}
