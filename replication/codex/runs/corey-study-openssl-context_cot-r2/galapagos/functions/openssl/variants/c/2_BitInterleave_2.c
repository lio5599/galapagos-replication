#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference leaves Ai unchanged.
    // XOR with zero preserves every bit, including for boundary inputs.
    return Ai ^ (uint64_t)0;
}


int main(){
    BitInterleave(0);
}
