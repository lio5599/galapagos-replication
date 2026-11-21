#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t y = x - (UINT64_C(1) << 52);
    uint64_t e = (y >> 52) & UINT64_C(0x7FF);
    return e == UINT64_C(0x7FF) ? UINT64_C(0) : y;
}


int main(){
    fpr_half(0);
}
