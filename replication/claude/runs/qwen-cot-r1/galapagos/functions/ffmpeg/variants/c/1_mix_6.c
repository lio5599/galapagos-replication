#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Decompose input colors into 5-6-5 components.
    // Compute 2*c0 + c1 for each channel separately.
    // Integer divide by 3 to get averaged component values.
    // Reconstruct output by shifting components to proper positions.
    int r0 = c0 >> 10, r1 = c1 >> 10;
    int g0 = (c0 & 0x07E0) >> 5, g1 = (c1 & 0x07E0) >> 5;
    int b0 = c0 & 0x001F, b1 = c1 & 0x001F;
    return ((2*r0+r1)/3)<<10 + ((2*g0+g1)/3)<<5 + ((2*b0+b1)/3);
}


int main(){
    mix(0,0);
}
