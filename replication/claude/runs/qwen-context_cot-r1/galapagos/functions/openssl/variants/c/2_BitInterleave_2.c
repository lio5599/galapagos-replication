#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The conditional block is dead code due to the constant false condition.
    // Therefore, the function behaves as an identity function.
    // We return Ai directly to match the reference behavior.
    return Ai;
}


int main(){
    BitInterleave(0);
}
