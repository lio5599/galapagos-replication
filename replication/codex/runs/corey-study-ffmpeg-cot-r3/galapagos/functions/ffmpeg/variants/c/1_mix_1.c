#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Place blue and green in separate eight-bit lanes before weighting.
    // Each weighted lane is at most 93, so no carry crosses lanes.
    // Extraction therefore recovers the exact original channel numerators.
    // Red retains the original signed operations, including negative inputs.
    int a = (c0 & 31) | ((c0 & 0x03E0) << 3);
    int b = (c1 & 31) | ((c1 & 0x03E0) << 3);
    int packed = 2 * a + b;
    int blue = packed & 255;
    int green = packed >> 8;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
