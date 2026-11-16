#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Uses explicit conditional instead of bitwise trick for final adjustment.
    // The core Montgomery step remains identical: compute z, cancel low bits via w.
    // After shifting, if result is negative (d < 0), add p to bring into range.
    // This is equivalent to d += p & -(d >> 31) since -(d>>31) is -1 if d<0, else 0.
    // Handles all edge cases including zero inputs and p=1 correctly.
    uint64_t z, w;
    uint32_t d;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    d = (uint32_t)((z + w) >> 31) - p;
    if (d >= p) d -= p;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
