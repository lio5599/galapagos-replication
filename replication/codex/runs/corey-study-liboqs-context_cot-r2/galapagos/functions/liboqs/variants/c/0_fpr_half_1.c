#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Compute the reference subtraction, then inspect its exponent.
    // An all-ones exponent makes the reference mask zero; otherwise it preserves x.
    // Unsigned subtraction preserves wraparound for all input bit patterns.
    uint64_t y = x - ((uint64_t)1 << 52);
    uint64_t e = (y >> 52) & (uint64_t)0x7FF;
    return e == (uint64_t)0x7FF ? (uint64_t)0 : y;
}


int main(){
    fpr_half(0);
}
