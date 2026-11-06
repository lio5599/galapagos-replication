#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Approach: add a constant and then subtract the same constant.
    // Unsigned arithmetic wraps modulo 2^64, so (x + c) - c == x for every x.
    // Even when the addition wraps, as for all-ones inputs, the subtraction restores Ai.
    const uint64_t c = 0x0123456789abcdefULL;
    uint64_t x = Ai + c;
    return x - c;
}


int main(){
    BitDeinterleave(0);
}
