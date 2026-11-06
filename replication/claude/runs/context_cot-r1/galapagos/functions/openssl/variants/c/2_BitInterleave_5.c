#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Approach: swap the 32-bit halves twice (rotate by 32 twice is a full 64-bit rotation).
    // The shift counts are exactly 32, which is valid for 64-bit operands, so all inputs return unchanged.
    uint64_t t = (Ai << 32) | (Ai >> 32);
    return (t << 32) | (t >> 32);
}


int main(){
    BitInterleave(0);
}
