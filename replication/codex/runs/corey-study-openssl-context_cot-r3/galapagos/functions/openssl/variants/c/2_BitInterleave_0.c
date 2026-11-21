#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference returns its input unchanged because its conditional is always false.
    // Directly returning Ai preserves every input, including zero and UINT64_MAX.
    return Ai;
}


int main(){
    BitInterleave(0);
}
