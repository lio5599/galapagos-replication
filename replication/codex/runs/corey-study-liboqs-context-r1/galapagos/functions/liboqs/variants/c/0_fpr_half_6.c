#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t e = (x >> 52) & 0x7FF;
    uint64_t nonzero = (e | ((uint64_t)0 - e)) >> 63;
    uint64_t y = x - ((uint64_t)1 << 52);
    return y & ((uint64_t)0 - nonzero);
}


int main(){
    fpr_half(0);
}
