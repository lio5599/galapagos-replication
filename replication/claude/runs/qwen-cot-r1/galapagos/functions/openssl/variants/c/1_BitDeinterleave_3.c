#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Because the conditional is always false, the body is never reached.
    // The function behaves as an identity function.
    // Returning Ai directly preserves this behavior for all inputs.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
