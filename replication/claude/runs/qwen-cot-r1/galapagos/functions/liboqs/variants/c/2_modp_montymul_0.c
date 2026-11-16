#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Computes Montgomery multiplication: (a * b * R^-1) mod p where R = 2^31.
    // Uses 64-bit intermediate arithmetic to avoid overflow during multiplication.
    // The factor p0i is the modular inverse of p mod 2^31, used to zero out low bits.
    // The final adjustment ensures the result is in [0, p-1] range.
    // Edge case: when a or b is zero, result is zero; when p=1, result is zero.
    uint64_t z, w;
    uint32_t d;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    d = (uint32_t)((z + w) >> 31) - p;
    d += p & -(d >> 31);
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
