#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Subtracts p only when the wrapped difference has its top bit clear.
    // Otherwise the reference adds p back and returns the shifted value.
    // Computing the decision from the wrapped difference preserves behavior
    // for all inputs, without assuming a reduced Montgomery operand range.
    uint64_t z = (uint64_t)a * b;
    uint64_t w = ((z * p0i) & 0x7FFFFFFFULL) * p;
    uint32_t t = (uint32_t)((z + w) >> 31);
    uint32_t d = t - p;
    uint32_t subtract = (uint32_t)((uint64_t)p * (1U - (d >> 31)));
    return (uint32_t)(t - subtract);
}


int main(){
    modp_montymul(0,0,0,0);
}
