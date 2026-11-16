#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The dead code in the if statement means Ai is never modified.
    // We return Ai as-is to maintain equivalence.
    // This approach is trivially correct.
    // Edge cases: all inputs yield identical outputs.
    return Ai;
}


int main(){
    BitInterleave(0);
}
