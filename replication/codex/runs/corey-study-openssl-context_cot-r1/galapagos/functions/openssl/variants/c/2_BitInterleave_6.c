#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Split the input into its low and high 32-bit portions, then recombine.
    // The portions are disjoint and cover all bits, preserving every input.
    uint64_t low = Ai & 0xFFFFFFFFULL;
    uint64_t high = Ai >> 32;
    return (high << 32) | low;
}


int main(){
    BitInterleave(0);
}
