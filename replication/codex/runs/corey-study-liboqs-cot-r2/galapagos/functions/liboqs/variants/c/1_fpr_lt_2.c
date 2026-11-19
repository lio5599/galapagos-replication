#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Build ordering keys using masks rather than conditional expressions.
    // A negative sign produces an all-one mask; otherwise only bit 63 flips.
    // The resulting unsigned order handles equality and both zero encodings.
    uint64_t sign = UINT64_C(1) << 63;
    uint64_t mx = (UINT64_C(0) - (x >> 63)) | sign;
    uint64_t my = (UINT64_C(0) - (y >> 63)) | sign;

    return (x ^ mx) < (y ^ my);
}


int main(){
    fpr_lt(0,0);
}
