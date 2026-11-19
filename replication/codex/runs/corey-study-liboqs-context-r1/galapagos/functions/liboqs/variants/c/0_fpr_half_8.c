#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t y = x + UINT64_C(0xFFF0000000000000);
    uint64_t t = (((y >> 52) & 0x7FF) + 1) >> 11;
    return y & (t - (uint64_t)1);
}


int main(){
    fpr_half(0);
}
