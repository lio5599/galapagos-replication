#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint32_t e = (uint32_t)(x >> 52) & 0x7FF;
    uint32_t t = (e + 0x7FF) >> 11;
    uint64_t mask = (uint64_t)0 - (uint64_t)t;
    return (x - ((uint64_t)1 << 52)) & mask;
}


int main(){
    fpr_half(0);
}
