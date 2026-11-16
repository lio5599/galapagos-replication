#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t exp_bits = (x >> 52) & 0x7FF;
    if (exp_bits == 0) return x;
    return (x & 0x000FFFFFFFFFFFFFULL) | ((exp_bits - 1) << 52);
}


int main(){
    fpr_half(0);
}
