#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Extract the narrowed quotient from the sum's high word and bit 31.
    // Shifting the high word left discards bit 63, as the reference's cast does.
    // The sum wraps before extraction, preserving every overflow edge case.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint64_t sum = z + w;
    uint32_t q = ((uint32_t)(sum >> 32) << 1)
               | ((uint32_t)sum >> 31);
    uint32_t d = q - p;

    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
