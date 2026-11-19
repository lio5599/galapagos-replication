#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint32_t exponent = (uint32_t)(x >> 52) & 0x7FF;
    uint32_t nonzero = (exponent + 0x7FFU) >> 11;
    return (x - ((uint64_t)1 << 52))
        & ((uint64_t)0 - (uint64_t)nonzero);
}


int main(){
    fpr_half(0);
}
