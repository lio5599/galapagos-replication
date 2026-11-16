#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // The reference code has a dead code block guarded by if(0).
    // Therefore, the function simply returns its argument unchanged.
    // This version returns Ai without any modification.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
