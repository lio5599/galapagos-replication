#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: use conditional logic to handle zero explicitly.
    // If exponent is 0, return 0 immediately.
    // Otherwise, decrement exponent by subtracting 1<<52.
    // This avoids complex masking for zero case.
    // Equivalent because zero input stays zero, others have exponent decremented.
    if (((x >> 52) & 0x7FF) == 0) {
        return 0;
    }
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
