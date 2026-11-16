#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t sub = (uint64_t)1 << 52;
    x -= sub;
    uint32_t t = (((uint32_t)(x >> 52) & 0x7FF) + 1) >> 11;
    x &= (uint64_t)t - 1;
    return x;
}


int main(){
    fpr_half(0);
}
