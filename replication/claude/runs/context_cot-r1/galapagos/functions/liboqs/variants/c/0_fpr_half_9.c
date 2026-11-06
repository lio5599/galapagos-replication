#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Isolate the exponent bits E = x & 0x7FF0..0 and add 0x7FF0..0.
    // The sum stays below 2^64 (max 0xFFE0..0), and bit 63 is set iff E >= 2^52, i.e. E != 0.
    // Use that bit as the keep flag for x - 2^52, matching the reference's zero handling.
    uint64_t E = x & (uint64_t)0x7FF0000000000000;
    uint64_t keep = (E + (uint64_t)0x7FF0000000000000) >> 63;
    return (x - ((uint64_t)1 << 52)) & ((uint64_t)0 - keep);
}


int main(){
    fpr_half(0);
}
