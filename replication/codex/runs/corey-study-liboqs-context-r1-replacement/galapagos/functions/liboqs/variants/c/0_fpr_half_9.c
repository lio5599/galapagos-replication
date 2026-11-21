#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t y = x - UINT64_C(0x0010000000000000);
    uint64_t e = (y >> 52) & UINT64_C(0x7FF);
    uint64_t clear_mask = UINT64_C(0) -
        ((e + UINT64_C(1)) >> 11);
    return y ^ (y & clear_mask);
}


int main(){
    fpr_half(0);
}
