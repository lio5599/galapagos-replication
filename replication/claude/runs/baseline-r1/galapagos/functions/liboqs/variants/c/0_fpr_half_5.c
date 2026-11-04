#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t e;

    e = (x >> 52) & 0x7FF;
    return (x - ((uint64_t)1 << 52)) * (uint64_t)(e != 0);
}


int main(){
    fpr_half(0);
}
