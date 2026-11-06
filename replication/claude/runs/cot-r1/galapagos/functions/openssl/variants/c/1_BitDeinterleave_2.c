#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Approach: reverse the byte order twice with mask-and-shift swaps.
    // A byte swap undoes itself, so applying it twice gives back the original Ai,
    // which matches the reference identity.
    // All operations are on unsigned 64-bit values, so every input is well defined.
    int k;
    uint64_t x = Ai;
    for (k = 0; k < 2; k++) {
        x = ((x & 0x00ff00ff00ff00ffULL) << 8) | ((x >> 8) & 0x00ff00ff00ff00ffULL);
        x = ((x & 0x0000ffff0000ffffULL) << 16) | ((x >> 16) & 0x0000ffff0000ffffULL);
        x = (x << 32) | (x >> 32);
    }
    return x;
}


int main(){
    BitDeinterleave(0);
}
