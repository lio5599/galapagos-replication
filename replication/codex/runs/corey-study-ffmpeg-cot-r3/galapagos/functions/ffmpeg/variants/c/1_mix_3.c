#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // For bounded channels, floor of the weighted mean is a plus floor delta/3.
    // Subtracting two for negative delta converts C truncation into floor.
    // Deltas range from -31 to 31, so this correction is always safe.
    // Red uses the reference expression, preserving its signed edge cases.
    int blue0 = c0 & 31;
    int green0 = (c0 & 0x03E0) >> 5;
    int db = (c1 & 31) - blue0;
    int dg = ((c1 & 0x03E0) >> 5) - green0;
    int blue = blue0 + (db - (db < 0 ? 2 : 0)) / 3;
    int green = green0 + (dg - (dg < 0 ? 2 : 0)) / 3;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + green * 32 + blue;
}


int main(){
    mix(0,0);
}
