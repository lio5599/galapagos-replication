#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Process each color channel independently.
    // Apply weights 2 and 1 to c0 and c1 respectively.
    // Divide sum by 3 for weighted average with truncation.
    // Combine channels into final 16-bit 5-6-5 color value.
    int cr0 = c0 >> 10, cr1 = c1 >> 10;
    int cg0 = (c0 >> 5) & 63, cg1 = (c1 >> 5) & 63;
    int cb0 = c0 & 31, cb1 = c1 & 31;
    return ((2*cr0+cr1)/3)*1024 + ((2*cg0+cg1)/3)*32 + ((2*cb0+cb1)/3);
}


int main(){
    mix(0,0);
}
