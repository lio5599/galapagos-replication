#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Use unsigned subtraction to reproduce the reference's difference bits.
    // Same-sign operands differ by at most the largest signed 64-bit value.
    // For different signs, clearing y makes the forward bit equal x's sign.
    // Selecting the reverse bit only for two negatives preserves equality.
    uint64_t different = (x ^ y) >> 63;
    uint64_t z = y & ~(UINT64_C(0) - different);
    unsigned forward = (unsigned)((x - z) >> 63);
    unsigned reverse = (unsigned)((z - x) >> 63);
    unsigned both_negative = (unsigned)((x & y) >> 63);

    return (int)(forward ^ ((forward ^ reverse) & both_negative));
}


int main(){
    fpr_lt(0,0);
}
