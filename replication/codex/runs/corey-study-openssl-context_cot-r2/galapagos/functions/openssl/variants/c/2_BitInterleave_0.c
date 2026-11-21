#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference returns its input unchanged because its branch is disabled.
    // Returning Ai directly preserves every input, including zero and the maximum.
    return Ai;
}


int main(){
    BitInterleave(0);
}
