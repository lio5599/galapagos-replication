#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference returns Ai unchanged because its if (0) body never executes.
    // Directly returning Ai preserves every input, including zero and all ones.
    return Ai;
}


int main(){
    BitInterleave(0);
}
