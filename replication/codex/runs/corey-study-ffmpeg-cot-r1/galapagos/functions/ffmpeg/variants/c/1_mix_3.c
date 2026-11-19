#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Uses an exact bounded reciprocal for blue and green division.
    // For every n from 0 through 93, floor(n * 171 / 512) equals floor(n / 3).
    // The largest product is 15903, safe even with 16-bit int.
    // Red keeps signed division, preserving negative-input behavior.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    blue = (blue * 171) >> 9;
    green = (green * 171) >> 9;
    return (red / 3) * 1024 + green * 32 + blue;
}


int main(){
    mix(0,0);
}
