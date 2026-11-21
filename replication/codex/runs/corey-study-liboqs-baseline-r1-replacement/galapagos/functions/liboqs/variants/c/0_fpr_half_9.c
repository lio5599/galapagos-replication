#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t high = x >> 52;
    if ((high & UINT64_C(0x7FF)) == 0)
        return 0;
    return ((high - UINT64_C(1)) << 52)
        | (x & UINT64_C(0x000FFFFFFFFFFFFF));
}


int main(){
    fpr_half(0);
}
