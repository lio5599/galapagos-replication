#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t magnitude = x & (((uint64_t)1 << 63) - 1);
    if (magnitude < ((uint64_t)1 << 52)) {
        return 0;
    }
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
