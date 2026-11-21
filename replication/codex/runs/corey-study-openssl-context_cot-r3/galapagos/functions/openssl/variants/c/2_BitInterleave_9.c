#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Add one modulo 2 to the 64th, then subtract one with unsigned arithmetic.
    // The operations cancel even when UINT64_MAX wraps to zero.
    uint64_t incremented = (uint64_t)(Ai + 1ULL);
    return (uint64_t)(incremented - 1ULL);
}


int main(){
    BitInterleave(0);
}
