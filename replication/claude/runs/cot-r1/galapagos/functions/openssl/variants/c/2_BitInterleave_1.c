#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference is the identity, so we XOR with a constant twice.
    // (x ^ k) ^ k == x for any k, because XOR is its own inverse bitwise.
    // Unsigned 64-bit XOR has no overflow or edge cases, so all inputs round-trip exactly.
    const uint64_t k = 0x9E3779B97F4A7C15ULL;
    uint64_t t = Ai ^ k;
    return t ^ k;
}


int main(){
    BitInterleave(0);
}
