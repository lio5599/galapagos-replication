#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference leaves Ai unchanged.
    // Complementing twice restores every bit, including all-zero and all-one inputs.
    return ~(~Ai);
}


int main(){
    BitInterleave(0);
}
