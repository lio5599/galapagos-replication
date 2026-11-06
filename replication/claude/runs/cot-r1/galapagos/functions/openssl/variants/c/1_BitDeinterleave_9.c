#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Approach: take the bitwise complement twice.
    // ~~x == x for unsigned integers, so the result equals Ai, as in the reference.
    // Applying ~ to uint64_t produces a uint64_t with no integer promotion problems.
    // Zero becomes all-ones and then zero again, so it is restored correctly.
    uint64_t x = ~Ai;
    return ~x;
}


int main(){
    BitDeinterleave(0);
}
