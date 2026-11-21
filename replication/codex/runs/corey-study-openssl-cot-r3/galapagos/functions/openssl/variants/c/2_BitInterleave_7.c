#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Extract eight 8-bit groups and restore each to its original position.
    // These disjoint groups cover all 64 bits, yielding the reference identity.
    // Shifts range from zero to 56, safely handling every input bit pattern.
    uint64_t result = 0;
    unsigned int shift;
    for (shift = 0; shift < 64; shift += 8) {
        uint64_t group = (Ai >> shift) & (uint64_t)0xff;
        result |= group << shift;
    }
    return result;
}


int main(){
    BitInterleave(0);
}
