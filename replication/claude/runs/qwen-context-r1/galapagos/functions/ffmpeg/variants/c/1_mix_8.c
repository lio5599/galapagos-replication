#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int b0 = c0 & 0x001F;
    int b1 = c1 & 0x001F;
    int g0 = (c0 & 0x03E0) >> 5;
    int g1 = (c1 & 0x03E0) >> 5;
    int r0 = c0 >> 10;
    int r1 = c1 >> 10;
    int blue = b0 * 2 + b1;
    int green = g0 * 2 + g1;
    int red = r0 * 2 + r1;
    int r = red / 3;
    int g = green / 3;
    int b = blue / 3;
    return (r << 10) + (g << 5) + b;
}


int main(){
    mix(0,0);
}
