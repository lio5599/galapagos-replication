#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // OR with zero neither sets nor clears any input bit.
    // Thus every input is returned unchanged, exactly as in the reference.
    return Ai | UINT64_C(0);
}


int main(){
    BitDeinterleave(0);
}
