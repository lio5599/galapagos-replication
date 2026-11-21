#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    return ((x >> 52) & UINT64_C(0x7FF))
        ? x - UINT64_C(0x0010000000000000)
        : UINT64_C(0);
}


int main(){
    fpr_half(0);
}
