#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // XOR with the same fixed mask twice restores the original bits.
    // This is an identity for every possible input pattern.
    uint64_t mask = (uint64_t)0xA5A5A5A5A5A5A5A5ULL;
    uint64_t toggled = Ai ^ mask;
    return toggled ^ mask;
}


int main(){
    BitDeinterleave(0);
}
