#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t s = x & 0x8000000000000000ULL;
    uint64_t e = (x >> 52) & 0x7FF;
    uint64_t m = x & 0x000FFFFFFFFFFFFFULL;
    if (e == 0) {
        return 0;
    }
    return s | ((e - 1) << 52) | m;
}


int main(){
    fpr_half(0);
}
