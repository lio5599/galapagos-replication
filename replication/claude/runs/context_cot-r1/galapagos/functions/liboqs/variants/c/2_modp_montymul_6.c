#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // The mask comes from an arithmetic right shift of d viewed as int32_t.
    // It is all ones when bit 31 is set, else zero, which equals -(d>>31).
    // Conversion to int32_t and ashr are two's complement in clang and LLVM.
    // The reduction part keeps the reference's 64-bit wrapping semantics.
    uint64_t z, w;
    uint32_t d, mask;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    d = (uint32_t)((z + w) >> 31) - p;
    mask = (uint32_t)((int32_t)d >> 31);
    d += p & mask;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
