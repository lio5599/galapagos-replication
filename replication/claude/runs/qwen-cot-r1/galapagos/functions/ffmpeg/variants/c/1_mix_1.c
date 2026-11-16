#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Extract each 5-6-5 component separately.
    // Compute weighted sum (2*c0 + c1) for each channel.
    // Divide by 3 using integer division for averaging.
    // Reconstruct 16-bit color by shifting and adding.
    int b0 = c0 & 0x1F, b1 = c1 & 0x1F;
    int g0 = (c0 >> 5) & 0x3F, g1 = (c1 >> 5) & 0x3F;
    int r0 = c0 >> 10, r1 = c1 >> 10;
    return ((2*r0+r1)/3) << 10 | ((2*g0+g1)/3) << 5 | ((2*b0+b1)/3);
}


int main(){
    mix(0,0);
}
