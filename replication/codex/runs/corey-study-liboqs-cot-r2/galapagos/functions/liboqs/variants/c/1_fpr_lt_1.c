#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Convert each encoding to an unsigned key that increases with its order.
    // Complement negatives and flip the sign bit of positives.
    // This preserves equality and places negative zero just below positive zero.
    uint64_t kx = (x >> 63) ? ~x : (x ^ (UINT64_C(1) << 63));
    uint64_t ky = (y >> 63) ? ~y : (y ^ (UINT64_C(1) << 63));

    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
