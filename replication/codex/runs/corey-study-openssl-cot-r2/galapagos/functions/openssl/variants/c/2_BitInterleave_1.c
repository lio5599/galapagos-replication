#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Copy the input without modification, matching the reference's identity.
    // The identical type preserves every bit for all inputs, including extremes.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitInterleave(0);
}
