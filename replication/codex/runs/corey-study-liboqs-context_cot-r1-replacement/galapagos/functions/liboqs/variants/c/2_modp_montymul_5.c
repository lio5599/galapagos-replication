#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Replaces the final mask with a branch on exactly the same high bit.
    // This tests the wrapped subtraction, not a mathematical comparison.
    // Adding p still wraps to uint32_t, preserving arbitrary-input behavior.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    if ((d >> 31) != 0) {
        d += p;
    }
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
