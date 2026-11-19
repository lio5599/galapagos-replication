#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t y = x - ((uint64_t)1 << 52);
    uint64_t mask = (uint64_t)(((y >> 52) & 0x7FF) == 0x7FF) - 1;
    return y & mask;
}


int main(){
    fpr_half(0);
}
