#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Use XOR for carry-free addition and twice AND for the carry contribution.
    // This identity holds modulo 2^64, including a carry beyond the top bit.
    // The shift, truncation, and final correction therefore remain identical.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint64_t sum = (z ^ w) + ((z & w) << 1);
    uint32_t d = (uint32_t)(sum >> 31) - p;

    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
