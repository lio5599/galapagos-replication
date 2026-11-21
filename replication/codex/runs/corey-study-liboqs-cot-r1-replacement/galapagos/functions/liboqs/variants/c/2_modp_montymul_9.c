#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Shift each addend separately and include the carry from their low bits.
    // This computes the unwrapped sum divided by 2^31 without overflowing.
    // A reference sum overflow changes this quotient by exactly 2^33.
    // Casting to 32 bits discards that difference, including at overflow edges.
    // The final subtraction and top-bit correction are unchanged.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & UINT64_C(0x7FFFFFFF)) * p;
    uint64_t carry = ((z & UINT64_C(0x7FFFFFFF))
                      + (w & UINT64_C(0x7FFFFFFF))) >> 31;
    uint32_t q = (uint32_t)((z >> 31) + (w >> 31) + carry);
    uint32_t d = q - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
