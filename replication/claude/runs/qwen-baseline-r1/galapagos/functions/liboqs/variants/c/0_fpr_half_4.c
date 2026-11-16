#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint32_t exp = (uint32_t)(x >> 52) & 0x7FF;
    if (exp == 0) return x;
    uint64_t new_exp = (uint64_t)(exp - 1) << 52;
    return (x & 0x000FFFFFFFFFFFFFULL) | new_exp;
}


int main(){
    fpr_half(0);
}
