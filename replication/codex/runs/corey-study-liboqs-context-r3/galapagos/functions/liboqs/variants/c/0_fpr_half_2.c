#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t exponent = (x >> 52) & 0x7FF;
    uint64_t mask = (uint64_t)0 - (uint64_t)(exponent != 0);
    return (x - ((uint64_t)1 << 52)) & mask;
}


int main(){
    fpr_half(0);
}
