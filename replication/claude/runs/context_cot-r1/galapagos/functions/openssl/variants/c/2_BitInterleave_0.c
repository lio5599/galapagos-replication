#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Reference: the interleave code is under if ((0)), so it never runs and Ai is returned unchanged.
    // Approach: return the input directly, which is the identity mapping.
    // Every 64-bit input, including 0 and all-ones, is returned as is.
    return Ai;
}


int main(){
    BitInterleave(0);
}
