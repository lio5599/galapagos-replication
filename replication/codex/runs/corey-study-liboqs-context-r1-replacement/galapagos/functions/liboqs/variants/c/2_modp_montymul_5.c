#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t t = z * p0i;
    t &= UINT64_C(0x7FFFFFFF);
    z += t * p;
    uint32_t q = (uint32_t)(z >> 31);
    uint32_t d = q - p;
    if ((d & UINT32_C(0x80000000)) != 0) {
        return q;
    }
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
