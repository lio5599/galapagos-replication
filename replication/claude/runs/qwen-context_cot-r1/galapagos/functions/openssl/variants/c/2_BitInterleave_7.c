#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The condition (0) ensures the interleaving code is never executed.
    // The function therefore returns the input value unchanged.
    // This is a straightforward identity implementation.
    return Ai;
}


int main(){
    BitInterleave(0);
}
