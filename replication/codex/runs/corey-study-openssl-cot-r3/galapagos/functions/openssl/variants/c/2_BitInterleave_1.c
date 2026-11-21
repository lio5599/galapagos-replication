#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Copy the input without transformation, matching the unreachable branch.
    // The identical type preserves every bit for every possible input.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitInterleave(0);
}
