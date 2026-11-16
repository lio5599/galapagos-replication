#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Use mask-based extraction for green channel.
    // Compute weighted average per channel.
    // Repack using shifts and bitwise OR.
    int r = (2 * (c0 >> 10) + (c1 >> 10)) / 3;
    int g = (2 * ((c0 & 0x07E0) >> 5) + ((c1 & 0x07E0) >> 5)) / 3;
    int b = (2 * (c0 & 0x001F) + (c1 & 0x001F)) / 3;
    return (r << 10) | (g << 5) | b;
}


int main(){
    mix(0,0);
}
