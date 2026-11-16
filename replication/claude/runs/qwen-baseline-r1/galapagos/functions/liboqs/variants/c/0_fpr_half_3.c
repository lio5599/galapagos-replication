#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t mask = (uint64_t)0x7FF << 52;
    uint32_t exp = (uint32_t)(x >> 52) & 0x7FF;
    if (exp == 0) return x;
    return (x & ~mask) | (((uint64_t)(exp - 1)) << 52);
}


int main(){
    fpr_half(0);
}
