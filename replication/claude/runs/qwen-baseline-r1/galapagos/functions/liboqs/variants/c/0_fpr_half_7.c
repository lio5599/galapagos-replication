#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t exp_field = (x >> 52) & 0x7FF;
    if (exp_field == 0) return x;
    return x - (1ULL << 52);
}


int main(){
    fpr_half(0);
}
