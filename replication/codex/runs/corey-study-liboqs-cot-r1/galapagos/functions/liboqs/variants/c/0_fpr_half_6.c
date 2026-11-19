#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // After subtraction, the masked exponent is either below the all-ones
    // field or equal to it. Equality means the original exponent was zero.
    // Select zero only in that case, matching all signs and fraction values.
    uint64_t y = x - ((uint64_t)1 << 52);
    uint64_t field = y & ((uint64_t)0x7FF << 52);
    return field < ((uint64_t)0x7FF << 52) ? y : (uint64_t)0;
}


int main(){
    fpr_half(0);
}
