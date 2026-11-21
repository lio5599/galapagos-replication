#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t exponent = (x >> 52) & UINT64_C(0x7FF);
    return (x - (UINT64_C(1) << 52)) * (uint64_t)(exponent != 0);
}


int main(){
    fpr_half(0);
}
