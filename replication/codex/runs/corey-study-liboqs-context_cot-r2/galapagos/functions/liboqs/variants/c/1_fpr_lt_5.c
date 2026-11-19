#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Map encodings to ascending unsigned keys.
    // Flip the sign bit for positives and complement every bit for negatives.
    // Negative keys precede positive keys, and equal encodings stay equal.
    uint64_t high = (uint64_t)1 << 63;
    uint64_t mx = ((uint64_t)0 - (x >> 63)) | high;
    uint64_t my = ((uint64_t)0 - (y >> 63)) | high;

    return (x ^ mx) < (y ^ my);
}


int main(){
    fpr_lt(0,0);
}
