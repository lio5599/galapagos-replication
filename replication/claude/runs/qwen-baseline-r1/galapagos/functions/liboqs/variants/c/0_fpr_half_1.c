#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t bias = (uint64_t)1 << 52;
    uint32_t exp = (uint32_t)(x >> 52) & 0x7FF;
    if (exp <= 1) return x;
    return x - bias;
}


int main(){
    fpr_half(0);
}
