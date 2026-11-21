#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Copy the input without executing any interleaving operations.
    // The copy preserves all 64 bits for every possible input.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitInterleave(0);
}
