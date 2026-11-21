#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Complementing twice restores every original bit.
    // No input, including zero or all ones, is exceptional.
    return (uint64_t)~((uint64_t)~Ai);
}


int main(){
    BitDeinterleave(0);
}
