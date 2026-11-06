#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Approach: apply bitwise NOT twice; ~~x == x for unsigned integers.
    // This matches the reference identity for every input.
    // No overflow or undefined behavior is possible.
    uint64_t n = ~Ai;
    return ~n;
}


int main(){
    BitDeinterleave(0);
}
