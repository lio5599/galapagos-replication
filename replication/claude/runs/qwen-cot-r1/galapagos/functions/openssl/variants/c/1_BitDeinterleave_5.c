#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Reference function is effectively an identity function due to if(0).
    // No bits are modified or rearranged.
    // Returning Ai directly achieves identical results for all uint64_t values.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
