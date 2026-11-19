#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    switch ((x >> 52) & 0x7FF) {
        case 0:
            return 0;
        default:
            return x - ((uint64_t)1 << 52);
    }
}


int main(){
    fpr_half(0);
}
