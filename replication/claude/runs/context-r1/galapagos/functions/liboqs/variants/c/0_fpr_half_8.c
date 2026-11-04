#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint32_t hi = (uint32_t)(x >> 32);
    uint32_t lo = (uint32_t)x;
    uint32_t t, mask;

    hi -= (uint32_t)0x00100000;
    t = (((hi >> 20) & 0x7FF) + 1) >> 11;
    mask = t - 1;
    return ((uint64_t)(hi & mask) << 32) | (uint64_t)(lo & mask);
}


int main(){
    fpr_half(0);
}
