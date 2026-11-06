#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Summary: the reference returns Ai unchanged because its if ((0)) block never runs.
    // Approach: return the argument directly.
    // The bit-shuffling code in the reference is dead, so only "return Ai" takes effect.
    // This holds for every 64-bit input, including 0 and all-ones.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
