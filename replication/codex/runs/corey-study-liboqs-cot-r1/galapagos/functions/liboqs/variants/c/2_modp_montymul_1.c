#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    // Replace the masked addition with an explicit conditional addition.
    // The condition tests bit 31, exactly as the reference does.
    // It does not substitute a borrow test, so arbitrary inputs remain equivalent.
    uint64_t z = (uint64_t)a * (uint64_t)b;
    uint64_t w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    uint32_t d = (uint32_t)((z + w) >> 31) - p;
    if ((d >> 31) != 0u)
        d += p;
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
