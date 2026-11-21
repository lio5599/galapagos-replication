#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // An all-ones mask preserves all 64 input bits.
    // Thus zero, the maximum value, and all other inputs remain unchanged.
    return Ai & (uint64_t)-1;
}


int main(){
    BitDeinterleave(0);
}
