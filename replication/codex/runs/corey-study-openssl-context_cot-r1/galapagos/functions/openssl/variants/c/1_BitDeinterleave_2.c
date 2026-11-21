#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // XOR with zero preserves every bit.
    // This matches the reference's identity operation for every input.
    return Ai ^ (uint64_t)0;
}


int main(){
    BitDeinterleave(0);
}
