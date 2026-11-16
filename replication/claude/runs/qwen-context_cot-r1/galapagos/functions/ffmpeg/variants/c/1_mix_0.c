#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Reference: mixes two 16-bit RGB565 colors by averaging each channel.
    // Blue: 5 bits (0-31), Green: 6 bits (0-63), Red: 5 bits (0-31).
    // Each channel computes (2*c0_channel + c1_channel) / 3, then packs back.
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
