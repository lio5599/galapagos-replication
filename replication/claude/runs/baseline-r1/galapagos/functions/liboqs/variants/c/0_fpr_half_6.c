#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t e, m;

    e = (x >> 52) & 0x7FF;
    m = ((e - 1) >> 63) - 1;
    return (x - ((uint64_t)1 << 52)) & m;
}


int main(){
    fpr_half(0);
}
