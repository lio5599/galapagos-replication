#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t exponent = (x >> 52) & UINT64_C(0x7FF);
    uint64_t zero = (exponent - UINT64_C(1)) >> 63;
    return (x - (UINT64_C(1) << 52)) & (zero - UINT64_C(1));
}


int main(){
    fpr_half(0);
}
