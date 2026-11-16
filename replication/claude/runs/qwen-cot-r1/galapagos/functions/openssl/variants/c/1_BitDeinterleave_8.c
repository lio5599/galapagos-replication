#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // The reference implementation contains unreachable code due to if(0).
    // Therefore, it acts as an identity function.
    // Returning Ai directly replicates this exact behavior.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
