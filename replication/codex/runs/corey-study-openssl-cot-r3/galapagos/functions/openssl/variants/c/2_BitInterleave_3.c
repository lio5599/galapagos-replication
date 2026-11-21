#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // OR with zero leaves every bit unchanged, as does the reference.
    // No input value, including zero or all ones, requires special handling.
    return Ai | (uint64_t)0;
}


int main(){
    BitInterleave(0);
}
