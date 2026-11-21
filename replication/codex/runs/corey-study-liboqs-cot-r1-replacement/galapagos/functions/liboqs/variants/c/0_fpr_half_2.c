#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Turn the reference's post-subtraction exponent test into a full-width mask.
    // The mask is zero exactly when the original exponent was zero.
    // Unsigned subtraction and masking also cover every sign and fraction.
    uint64_t y = x - (UINT64_C(1) << 52);
    uint64_t keep = (((y >> 52) & UINT64_C(0x7FF)) != UINT64_C(0x7FF));
    return y & (UINT64_C(0) - keep);
}


int main(){
    fpr_half(0);
}
