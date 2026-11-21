#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // XOR with zero preserves every bit, matching the reference's identity result.
    // This also holds for zero, all-one bits, and every other input pattern.
    return Ai ^ (uint64_t)0;
}


int main(){
    BitDeinterleave(0);
}
