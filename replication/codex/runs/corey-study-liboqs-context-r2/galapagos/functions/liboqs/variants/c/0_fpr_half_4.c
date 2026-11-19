#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t y = x - (UINT64_C(1) << 52);
    if (((y >> 52) & UINT64_C(0x7FF)) == UINT64_C(0x7FF))
        y = 0;
    return y;
}


int main(){
    fpr_half(0);
}
