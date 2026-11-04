#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    uint64_t e;

    e = (x << 1) >> 53;
    if (e) {
        x -= (uint64_t)1 << 52;
    } else {
        x = 0;
    }
    return x;
}


int main(){
    fpr_half(0);
}
