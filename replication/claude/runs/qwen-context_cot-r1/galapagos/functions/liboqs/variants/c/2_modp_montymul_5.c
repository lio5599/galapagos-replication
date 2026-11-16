#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Alternative using explicit sign extension for conditional logic
    // Computes the same result by explicitly handling the sign bit
    // of the 32-bit result to determine if p needs to be added
    uint64_t z, w;
    uint32_t d;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    d = (uint32_t)((z + w) >> 31) - p;
    int32_t sd = (int32_t)d;
    d = sd < 0 ? (uint32_t)(sd + p) : d;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
