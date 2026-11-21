#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // The reference returns its input unchanged because its branch is never taken.
    // Returning Ai directly preserves every bit, including zero and UINT64_MAX.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
