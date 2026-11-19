#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t exponent = (x >> 52) & 0x7FF;
    uint64_t zero = (exponent - (uint64_t)1) >> 63;
    uint64_t y = x - ((uint64_t)1 << 52);
    return y & (zero - (uint64_t)1);
}


int main(){
    fpr_half(0);
}
