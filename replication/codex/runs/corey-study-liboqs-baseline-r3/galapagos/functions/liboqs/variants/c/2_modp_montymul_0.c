#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t m = (z * p0i) & UINT64_C(0x7FFFFFFF);
    uint32_t d = (uint32_t)((z + m * p) >> 31) - p;
    return d + ((d >> 31) ? p : 0);
}


int main(){
    modp_montymul(0,0,0,0);
}
