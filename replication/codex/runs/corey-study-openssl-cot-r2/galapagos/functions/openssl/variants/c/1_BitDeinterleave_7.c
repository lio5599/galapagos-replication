#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Extract eight 8-bit groups and restore each to its original position.
    // Together they reconstruct the identity result of the reference.
    // Shift counts range from 0 to 56, preserving all inputs without overshifting.
    uint64_t result = 0;
    for (unsigned int shift = 0; shift < 64; shift += 8) {
        result |= ((Ai >> shift) & (uint64_t)0xff) << shift;
    }
    return result;
}


int main(){
    BitDeinterleave(0);
}
