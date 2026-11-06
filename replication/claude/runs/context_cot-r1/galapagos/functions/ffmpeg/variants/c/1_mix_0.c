#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Reference: blends two 15-bit RGB555 colors 2:1 (c0 weighted twice), per channel /3.
    // Approach: extract each channel with shift-then-mask instead of mask-then-shift.
    // (c>>5)&31 equals (c&0x3E0)>>5 exactly, also for negative c (arithmetic shift).
    // Red keeps signed c>>10 and signed truncating division, as in the reference.
    // No overflow is possible: red/3*1024 lies in [-2^31, 2^31-1024].
    int b = ((c0 & 31) << 1) + (c1 & 31);
    int g = (((c0 >> 5) & 31) << 1) + ((c1 >> 5) & 31);
    int r = (c0 >> 10) * 2 + (c1 >> 10);
    return r / 3 * 1024 + g / 3 * 32 + b / 3;
}


int main(){
    mix(0,0);
}
