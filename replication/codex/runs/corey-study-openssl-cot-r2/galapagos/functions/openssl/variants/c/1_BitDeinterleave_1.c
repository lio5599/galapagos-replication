#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Copy the input without modifying it, matching the inactive reference block.
    // The identical unsigned type preserves every value, including both extremes.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitDeinterleave(0);
}
