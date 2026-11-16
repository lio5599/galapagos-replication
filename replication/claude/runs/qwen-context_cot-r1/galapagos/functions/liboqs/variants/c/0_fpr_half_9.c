#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Halves positive IEEE 754 double by decrementing exponent.
    // Use bitwise trick to zero result on underflow.
    // Subtract 2^52 to decrement exponent.
    // If new exponent is 0, mask result to 0.
    // Mask derived from checking if exponent became 0.
    x -= (uint64_t)1 << 52;
    uint32_t new_exp = (uint32_t)(x >> 52) & 0x7FF;
    uint64_t mask = (new_exp != 0) ? ~0ULL : 0ULL;
    return x & mask;
}


int main(){
    fpr_half(0);
}
