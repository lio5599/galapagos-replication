#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // XOR with zero leaves every bit unchanged.
    // This matches the reference's skipped branch for every input,
    // including zero, all ones, and either endpoint bit set.
    return Ai ^ (uint64_t)0;
}


int main(){
    BitDeinterleave(0);
}
