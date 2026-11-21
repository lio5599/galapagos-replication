#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // The reference returns its input unchanged because its if condition is zero.
    // Returning Ai directly preserves every bit for all uint64_t inputs.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
