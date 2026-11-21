#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // The reference compares sign-magnitude encodings, with negative zero below positive zero.
    // Different signs are ordered by sign; equal signs use unsigned order,
    // reversed for negatives. Equal encodings always return zero.
    unsigned int sx = (unsigned int)(x >> 63);
    unsigned int sy = (unsigned int)(y >> 63);

    if (sx != sy) {
        return (int)sx;
    }
    return sx ? (x > y) : (x < y);
}


int main(){
    fpr_lt(0,0);
}
