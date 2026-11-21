#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Partition the input into complementary alternating-bit masks.
    // OR restores all bits, including for zero and the maximum input.
    uint64_t even = Ai & (uint64_t)0x5555555555555555ULL;
    uint64_t odd = Ai & (uint64_t)0xAAAAAAAAAAAAAAAAULL;
    return even | odd;
}


int main(){
    BitDeinterleave(0);
}
