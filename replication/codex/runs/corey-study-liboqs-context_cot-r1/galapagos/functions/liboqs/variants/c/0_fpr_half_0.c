#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // The reference returns zero if the exponent field is zero, otherwise x minus 2^52.
    // After unsigned subtraction, exponent zero wraps to 2047.
    // No other exponent becomes 2047, including for arbitrary sign and fraction bits.
    uint64_t y = x - ((uint64_t)1 << 52);
    return ((y >> 52) & 0x7FF) == 0x7FF ? (uint64_t)0 : y;
}


int main(){
    fpr_half(0);
}
