#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Approach: add a constant and then subtract it, using modular arithmetic.
    // (x + k) - k == x modulo 2^64, even when the addition wraps.
    // This is the identity, as in the reference, including near UINT64_MAX.
    uint64_t k = 0x0123456789ABCDEFULL;
    uint64_t t = Ai + k;
    return t - k;
}


int main(){
    BitDeinterleave(0);
}
