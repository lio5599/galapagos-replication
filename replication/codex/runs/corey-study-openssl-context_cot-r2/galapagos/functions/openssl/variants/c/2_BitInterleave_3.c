#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference leaves Ai unchanged.
    // OR with zero preserves every bit for all inputs.
    return Ai | (uint64_t)0;
}


int main(){
    BitInterleave(0);
}
