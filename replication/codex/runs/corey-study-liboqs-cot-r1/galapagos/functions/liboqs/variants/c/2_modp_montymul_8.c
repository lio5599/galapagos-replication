#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // After subtracting p, adding it back recovers q modulo 2^32.
    // Select q directly when the reference's correction bit is set.
    // Testing d rather than comparing q with p preserves arbitrary-input cases.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t q = (uint32_t)((z + w) >> 31);
    uint32_t d = q - p;
    return (d >> 31) != 0u ? q : d;
}


int main(){
    modp_montymul(0,0,0,0);
}
