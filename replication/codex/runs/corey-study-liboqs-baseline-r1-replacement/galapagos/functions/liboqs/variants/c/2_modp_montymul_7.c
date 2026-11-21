#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t factor =
        ((z & UINT64_C(0x7FFFFFFF)) *
         (p0i & UINT32_C(0x7FFFFFFF))) & UINT64_C(0x7FFFFFFF);
    uint32_t d = (uint32_t)((z + factor * p) >> 31) - p;
    uint32_t mask = (uint32_t)(UINT32_C(0) - (d >> 31));
    uint32_t restored = d + p;

    return (d & ~mask) | (restored & mask);
}


int main(){
    modp_montymul(0,0,0,0);
}
