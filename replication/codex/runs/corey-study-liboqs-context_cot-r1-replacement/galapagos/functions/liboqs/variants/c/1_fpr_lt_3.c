#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Construct ordered keys using masks instead of conditional selection.
    // A negative encoding is complemented; a positive encoding flips its sign.
    // Strict key comparison preserves equality and orders negative zero first.
    uint64_t high = (uint64_t)1 << 63;
    uint64_t mx = ((uint64_t)0 - (x >> 63)) | high;
    uint64_t my = ((uint64_t)0 - (y >> 63)) | high;

    return (x ^ mx) < (y ^ my);
}


int main(){
    fpr_lt(0,0);
}
