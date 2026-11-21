#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Complement every bit twice to restore the original input.
    // This is an identity for every bit pattern, including both extremes.
    return (uint64_t)~(uint64_t)~Ai;
}


int main(){
    BitInterleave(0);
}
