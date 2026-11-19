#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Computes the component-wise 2:1 weighted average, truncating division by 3.
    // Extracting green before weighting gives the same nonnegative sum.
    // Red retains the original signed shifts and division, including negative inputs.
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = 2 * ((c0 & 0x03E0) >> 5) + ((c1 & 0x03E0) >> 5);
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return (red / 3) * 1024 + (green / 3) * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
