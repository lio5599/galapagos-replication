#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference leaves Ai unchanged.
    // XOR with the same mask twice restores every bit for every input.
    uint64_t mask = (uint64_t)0xa5a5a5a5a5a5a5a5ULL;
    uint64_t result = Ai ^ mask;
    return result ^ mask;
}


int main(){
    BitInterleave(0);
}
