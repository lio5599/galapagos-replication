#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Rotate left by one bit, then rotate right by one bit.
    // The inverse rotations restore all bits, including either endpoint bit.
    uint64_t rotated = (Ai << 1) | (Ai >> 63);
    return (rotated >> 1) | (rotated << 63);
}


int main(){
    BitDeinterleave(0);
}
