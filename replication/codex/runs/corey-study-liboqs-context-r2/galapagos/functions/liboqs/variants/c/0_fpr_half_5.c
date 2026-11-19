#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t y = x + UINT64_C(0xFFF0000000000000);
    uint64_t zero = (uint64_t)(
        (y & UINT64_C(0x7FF0000000000000)) ==
        UINT64_C(0x7FF0000000000000));
    return y & (zero - UINT64_C(1));
}


int main(){
    fpr_half(0);
}
