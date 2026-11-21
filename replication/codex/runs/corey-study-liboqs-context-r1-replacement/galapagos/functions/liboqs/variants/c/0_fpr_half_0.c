#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    if ((x & UINT64_C(0x7FF0000000000000)) == 0)
        return 0;
    return x - (UINT64_C(1) << 52);
}


int main(){
    fpr_half(0);
}
