#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t y = x - ((uint64_t)1 << 52);
    uint64_t exponent = (y >> 52) & 0x7FF;
    uint64_t clear = (exponent + 1) >> 11;
    return y ^ (y & ((uint64_t)0 - clear));
}


int main(){
    fpr_half(0);
}
