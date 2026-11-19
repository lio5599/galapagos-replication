#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint32_t hi = (uint32_t)(x >> 32);
    uint32_t lo = (uint32_t)x;

    if ((hi & UINT32_C(0x7FF00000)) == 0)
        return 0;

    hi = (uint32_t)(hi - UINT32_C(0x00100000));
    return ((uint64_t)hi << 32) | (uint64_t)lo;
}


int main(){
    fpr_half(0);
}
