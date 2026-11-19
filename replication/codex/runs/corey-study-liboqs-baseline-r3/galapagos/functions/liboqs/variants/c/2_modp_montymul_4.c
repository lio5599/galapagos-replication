#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t m = z * p0i;
    m = (m << 33) >> 33;
    z += m * p;
    uint32_t d = (uint32_t)(z >> 31) - p;
    return (d >> 31) == 0 ? d : (uint32_t)(d + p);
}


int main(){
    modp_montymul(0,0,0,0);
}
