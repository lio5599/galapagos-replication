#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // The reference leaves Ai unchanged.
    // Adding zero preserves every value without overflow, including the maximum.
    return Ai + (uint64_t)0;
}


int main(){
    BitInterleave(0);
}
