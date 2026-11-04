#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    return (x & 0x7FF0000000000000ULL) == 0 ? 0 : x - 0x0010000000000000ULL;
}


int main(){
    fpr_half(0);
}
