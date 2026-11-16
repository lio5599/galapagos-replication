#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference function is a no-op because the condition (0) is always false.
    // It simply returns the input Ai unchanged for all inputs.
    // All substitute implementations must also return Ai unchanged.
    return Ai;
}


int main(){
    BitInterleave(0);
}
