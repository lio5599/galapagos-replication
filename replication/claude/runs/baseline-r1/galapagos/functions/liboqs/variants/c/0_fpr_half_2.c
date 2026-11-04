#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    return (x & (uint64_t)0x7FF0000000000000) ? (x - ((uint64_t)1 << 52)) : (uint64_t)0;
}


int main(){
    fpr_half(0);
}
