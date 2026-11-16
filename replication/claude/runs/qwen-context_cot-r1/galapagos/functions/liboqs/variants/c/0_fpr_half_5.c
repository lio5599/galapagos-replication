#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Halves positive IEEE 754 double by decrementing exponent.
    // Compute whether exponent underflows (becomes 0).
    // If underflow, return 0; else return decremented value.
    // Uses comparison to determine underflow condition.
    // Mantissa bits preserved when no underflow.
    uint64_t exp = (x >> 52) & 0x7FF;
    uint64_t half_x = x - ((uint64_t)1 << 52);
    return (exp <= 1) ? 0 : half_x;
}


int main(){
    fpr_half(0);
}
