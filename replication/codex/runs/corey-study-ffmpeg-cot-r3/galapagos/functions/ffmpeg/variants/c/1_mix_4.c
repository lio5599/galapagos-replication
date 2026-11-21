#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // For every integer n from 0 through 93, floor n/3 equals (43*n) >> 7.
    // The reciprocal approximation never crosses the next integer here.
    // Its largest product is 3999, so even a 16-bit int can hold it.
    // Only bounded channels use this shortcut; signed red remains unchanged.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    blue = (blue * 43) >> 7;
    green = (green * 43) >> 7;
    return red / 3 * 1024 + green * 32 + blue;
}


int main(){
    mix(0,0);
}
