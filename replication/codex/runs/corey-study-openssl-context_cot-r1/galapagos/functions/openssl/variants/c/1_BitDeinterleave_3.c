#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // OR with zero leaves all input bits unchanged.
    // No boundary value receives special treatment.
    return Ai | (uint64_t)0;
}


int main(){
    BitDeinterleave(0);
}
