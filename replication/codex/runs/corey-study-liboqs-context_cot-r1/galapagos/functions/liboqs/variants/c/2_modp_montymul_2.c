#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // XOR supplies sum bits and the shifted AND supplies carries.
    // Their unsigned 64-bit sum equals z plus w modulo 2^64, even on overflow.
    // The extraction, subtraction, and correction otherwise remain unchanged.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint64_t sum = (z ^ w) + ((z & w) << 1);
    uint32_t d = (uint32_t)(sum >> 31) - p;
    return d + (p & (0U - (d >> 31)));
}


int main(){
    modp_montymul(0,0,0,0);
}
