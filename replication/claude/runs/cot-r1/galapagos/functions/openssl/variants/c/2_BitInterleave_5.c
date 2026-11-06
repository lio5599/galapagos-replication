#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference is the identity, so we negate twice using modular unsigned arithmetic.
    // 0 - (0 - x) == x mod 2^64, which C guarantees for uint64_t wraparound.
    // Edge cases such as 0 and 2^63 also map back to themselves.
    uint64_t n = (uint64_t)0 - Ai;
    return (uint64_t)0 - n;
}


int main(){
    BitInterleave(0);
}
