#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Adding p back to the wrapped difference recovers q modulo 2^32.
    // Select q precisely when the reference would apply that addition.
    // The selection uses the difference's high bit, not an ordering assumption.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t q = (uint32_t)((z + w) >> 31);
    uint32_t d = q - p;
    return (d >> 31) ? q : d;
}


int main(){
    modp_montymul(0,0,0,0);
}
