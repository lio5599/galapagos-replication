#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Add z and w in 32-bit limbs, propagating the low-limb carry.
    // Wrapping the high limb reproduces addition modulo 2^64.
    // Joining the required bits yields the same truncated right shift by 31.
    // The final subtraction and high-bit correction preserve all input cases.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint64_t low = (uint64_t)(uint32_t)z + (uint32_t)w;
    uint32_t high = (uint32_t)(z >> 32);
    high += (uint32_t)(w >> 32);
    high += (uint32_t)(low >> 32);
    uint32_t t = ((uint32_t)low >> 31) | (high << 1);
    uint32_t d = t - p;
    return d + (p & (0U - (d >> 31)));
}


int main(){
    modp_montymul(0,0,0,0);
}
