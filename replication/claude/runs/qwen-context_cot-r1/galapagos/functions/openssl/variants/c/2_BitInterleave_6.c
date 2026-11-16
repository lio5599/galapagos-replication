#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Dead code in the if block means the function is an identity mapping.
    // For every input Ai, the output is exactly Ai.
    // This implementation confirms the identity behavior.
    uint64_t output = Ai;
    return output;
}


int main(){
    BitInterleave(0);
}
