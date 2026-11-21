#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Magnitudes are below 2^63, so subtraction's high bit detects strict order.
    // A negative x selects the reversed subtraction when signs match.
    // Different signs select x's sign; equality yields zero in both subtractions.
    uint64_t mask = ((uint64_t)1 << 63) - 1;
    uint64_t a = x & mask;
    uint64_t b = y & mask;
    uint64_t sx = x >> 63;
    uint64_t different = (x ^ y) >> 63;
    uint64_t forward = (a - b) >> 63;
    uint64_t reverse = (b - a) >> 63;
    uint64_t same = forward ^ ((forward ^ reverse) & sx);

    return (int)((different & sx) | ((different ^ 1) & same));
}


int main(){
    fpr_lt(0,0);
}
