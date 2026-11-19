#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & UINT64_C(0x7FFFFFFF)) * p;
    uint64_t carry = ((z & UINT64_C(0x7FFFFFFF))
                    + (w & UINT64_C(0x7FFFFFFF))) >> 31;
    uint32_t q = (uint32_t)((z >> 31) + (w >> 31) + carry);
    uint32_t d = q - p;
    return d + ((d & UINT32_C(0x80000000)) ? p : 0);
}


int main(){
    modp_montymul(0,0,0,0);
}
