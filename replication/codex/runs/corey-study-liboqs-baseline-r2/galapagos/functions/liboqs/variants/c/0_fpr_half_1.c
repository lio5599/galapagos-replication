#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    return ((x >> 52) & 0x7FF)
        ? x - ((uint64_t)1 << 52)
        : 0;
}


int main(){
    fpr_half(0);
}
