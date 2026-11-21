#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Copy the input without modification, matching the reference's identity.
    // The same unsigned type preserves all bits for every input.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitInterleave(0);
}
