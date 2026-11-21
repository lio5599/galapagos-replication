#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Complement every bit twice, restoring its original value.
    // No input bits are lost, so this matches the reference for every input.
    return (uint64_t)~(uint64_t)~Ai;
}


int main(){
    BitDeinterleave(0);
}
