#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t e = (x >> 52) & UINT64_C(0x7FF);
    if (e == 0)
        return 0;
    return (x & UINT64_C(0x800FFFFFFFFFFFFF)) |
           ((e - UINT64_C(1)) << 52);
}


int main(){
    fpr_half(0);
}
