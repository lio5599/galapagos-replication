#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t product = z * p0i;
    uint64_t q = product % UINT64_C(0x80000000);
    uint64_t sum = z + q * p;
    uint32_t t = (uint32_t)(sum >> 31);
    uint32_t d = t - p;
    uint32_t keep = (d >> 31) - UINT32_C(1);
    return t - (p & keep);
}


int main(){
    modp_montymul(0,0,0,0);
}
