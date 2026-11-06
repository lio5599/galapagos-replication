#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Summary: the reference returns Ai unchanged, because its interleave block is guarded by if ((0)).
    // That block is dead code and never executes, so the function is the identity on all 64-bit inputs.
    // This version returns the argument directly.
    // Every value, including 0 and UINT64_MAX, is passed through unmodified.
    return Ai;
}


int main(){
    BitInterleave(0);
}
