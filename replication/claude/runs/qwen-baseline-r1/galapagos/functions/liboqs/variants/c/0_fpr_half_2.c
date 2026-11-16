#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint32_t exp = (uint32_t)(x >> 52) & 0x7FF;
    if (exp == 0) return x;
    x &= ~((uint64_t)0x7FF << 52);
    x |= ((uint64_t)(exp - 1) & 0x7FF) << 52;
    return x;
}


int main(){
    fpr_half(0);
}
