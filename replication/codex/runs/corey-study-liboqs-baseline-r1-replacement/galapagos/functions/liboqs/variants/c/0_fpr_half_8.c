#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t exponent = x & UINT64_C(0x7FF0000000000000);
    if (exponent == 0)
        return 0;
    return (x & UINT64_C(0x800FFFFFFFFFFFFF))
        | (exponent - UINT64_C(0x0010000000000000));
}


int main(){
    fpr_half(0);
}
