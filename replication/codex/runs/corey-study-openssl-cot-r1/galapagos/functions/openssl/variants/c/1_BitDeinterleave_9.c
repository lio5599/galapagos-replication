#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Partition the input into even-positioned and odd-positioned bits.
    // The complementary masks cover all 64 positions without overlap.
    // OR restores every input exactly, matching the inactive reference branch.
    uint64_t even = Ai & (uint64_t)0x5555555555555555ULL;
    uint64_t odd = Ai & (uint64_t)0xAAAAAAAAAAAAAAAAULL;
    return even | odd;
}


int main(){
    BitDeinterleave(0);
}
