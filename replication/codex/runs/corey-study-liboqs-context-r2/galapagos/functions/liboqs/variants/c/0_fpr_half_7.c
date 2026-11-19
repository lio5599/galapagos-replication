#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t y = x - UINT64_C(0x0010000000000000);
    uint64_t clear = UINT64_C(0) - (uint64_t)(
        (x & UINT64_C(0x7FF0000000000000)) == 0);
    return y ^ (y & clear);
}


int main(){
    fpr_half(0);
}
