#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Reference computes weighted average of 5-6-5 RGB components.
    // Blue: 5 bits, Green: 6 bits, Red: 5 bits.
    // Each channel is computed as (2*c0 + c1)/3 using integer division.
    // Results are reassembled into 16-bit 5-6-5 format.
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
