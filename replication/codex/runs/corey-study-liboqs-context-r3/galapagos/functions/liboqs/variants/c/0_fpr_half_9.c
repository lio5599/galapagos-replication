#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t y = x - ((uint64_t)1 << 52);
    uint64_t magnitude = x & (uint64_t)0x7FFFFFFFFFFFFFFFULL;
    if (magnitude < ((uint64_t)1 << 52))
        y = 0;
    return y;
}


int main(){
    fpr_half(0);
}
