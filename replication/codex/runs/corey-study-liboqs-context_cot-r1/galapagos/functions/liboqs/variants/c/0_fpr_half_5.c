#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Handle every zero-exponent encoding explicitly, not just floating-point zero.
    // Otherwise decrementing the exponent is exactly unsigned subtraction of 2^52.
    if ((x & ((uint64_t)0x7FF << 52)) == 0)
        return (uint64_t)0;
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
