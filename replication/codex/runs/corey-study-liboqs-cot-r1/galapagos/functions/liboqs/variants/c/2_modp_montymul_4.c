#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Extract the shifted result through the sum's two 32-bit halves.
    // Bits 31 through 62 are exactly the reference's truncated quotient.
    // The sum wraps before extraction, preserving overflow edge cases.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint64_t sum = z + w;
    uint32_t low = (uint32_t)sum;
    uint32_t high = (uint32_t)(sum >> 32);
    uint32_t q = (uint32_t)(((uint64_t)high << 1) | (low >> 31));
    uint32_t d = q - p;
    return d + (p & (uint32_t)(0u - (d >> 31)));
}


int main(){
    modp_montymul(0,0,0,0);
}
