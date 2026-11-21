#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The disabled branch makes the reference an identity function.
    // A same-type copy preserves all 64 bits for every input.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitInterleave(0);
}
