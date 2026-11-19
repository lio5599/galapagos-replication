#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Perform the unsigned subtraction first, including its wraparound.
    // The reference clears the result exactly when its exponent is 2047.
    uint64_t y = x - ((uint64_t)1 << 52);
    return ((y >> 52) & 0x7FF) == 0x7FF ? 0 : y;
}


int main(){
    fpr_half(0);
}
