#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t m = (uint64_t)(((uint32_t)z * p0i) << 1 >> 1);
    uint32_t d = (uint32_t)((z + m * p) >> 31) - p;
    return d + (p & (uint32_t)-(int32_t)(d >> 31));
}


int main(){
    modp_montymul(0,0,0,0);
}
