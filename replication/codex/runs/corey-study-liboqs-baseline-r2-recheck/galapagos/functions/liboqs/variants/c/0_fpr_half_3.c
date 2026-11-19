#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t nonzero = (uint64_t)((x & ((uint64_t)0x7FF << 52)) != 0);
    return (x - ((uint64_t)1 << 52)) * nonzero;
}


int main(){
    fpr_half(0);
}
