#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t m = ((z & UINT64_C(0x7FFFFFFF))
                  * (p0i & UINT32_C(0x7FFFFFFF)))
                 & UINT64_C(0x7FFFFFFF);
    uint64_t sum = z + m * p;
    uint32_t d = (uint32_t)(sum >> 31) - p;

    return d + (p & (UINT32_C(0) - (d >> 31)));
}


int main(){
    modp_montymul(0,0,0,0);
}
