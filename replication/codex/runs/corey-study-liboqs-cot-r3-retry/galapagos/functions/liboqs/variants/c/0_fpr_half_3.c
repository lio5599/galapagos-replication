#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Multiply the unsigned subtraction result by the exponent's nonzero indicator.
    // Multiplication by one preserves all bits; multiplication by zero clears them.
    // Thus zero-exponent encodings vanish and all others match the reference.
    uint32_t e = (uint32_t)(x >> 52) & 0x7FFU;
    uint64_t y = x - ((uint64_t)1 << 52);
    return y * (uint64_t)(e != 0);
}


int main(){
    fpr_half(0);
}
