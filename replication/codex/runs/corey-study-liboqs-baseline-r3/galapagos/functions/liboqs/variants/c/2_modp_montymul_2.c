#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t product = (uint64_t)a * b;
    uint32_t factor = (uint32_t)(product * p0i) & UINT32_C(0x7FFFFFFF);
    uint64_t sum = product + (uint64_t)factor * p;
    uint32_t result = (uint32_t)(sum >> 31) - p;
    return result + (uint32_t)((uint64_t)(result >> 31) * p);
}


int main(){
    modp_montymul(0,0,0,0);
}
