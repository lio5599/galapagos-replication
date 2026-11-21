#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // XOR with zero preserves every bit.
    // The reference is an identity operation, including at both extremes.
    return Ai ^ (uint64_t)0;
}


int main(){
    BitInterleave(0);
}
