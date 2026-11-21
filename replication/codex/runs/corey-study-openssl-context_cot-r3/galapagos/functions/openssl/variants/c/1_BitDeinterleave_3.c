#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // The reference returns Ai unchanged.
    // Adding zero preserves every unsigned value without overflow.
    return Ai + (uint64_t)0;
}


int main(){
    BitDeinterleave(0);
}
