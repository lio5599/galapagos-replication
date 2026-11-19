#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    if (((x >> 52) & 0x7FF) == 0) {
        return 0;
    }
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
