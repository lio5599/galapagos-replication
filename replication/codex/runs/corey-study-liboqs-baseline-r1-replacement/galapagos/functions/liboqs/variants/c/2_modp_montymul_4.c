#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t factor = (z * p0i) % UINT64_C(2147483648);
    uint64_t sum = z + factor * p;
    uint32_t d = (uint32_t)(sum / UINT64_C(2147483648)) - p;

    return d + ((d >= UINT32_C(2147483648)) ? p : UINT32_C(0));
}


int main(){
    modp_montymul(0,0,0,0);
}
