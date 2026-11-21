#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Copy the input into an identically typed local variable.
    // The reference is the identity function, so this preserves every input.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitDeinterleave(0);
}
