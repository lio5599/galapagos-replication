#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Unsigned left and right shifts isolate the low 31 multiplier bits.
    // Shifting by 33 is defined for uint64_t and matches the original mask.
    // The sum, truncation, subtraction, and correction remain unchanged.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t m = z * p0i;
    m = (m << 33) >> 33;
    uint64_t w = m * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
