#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // The reference returns its input unchanged.
    // Its constant-false branch never runs, so this holds for every input.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
