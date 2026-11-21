#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // AND with a 64-bit all-ones mask preserves the reference's unchanged input.
    // Conversion of minus one to uint64_t produces that mask for every input.
    return Ai & (uint64_t)-1;
}


int main(){
    BitInterleave(0);
}
