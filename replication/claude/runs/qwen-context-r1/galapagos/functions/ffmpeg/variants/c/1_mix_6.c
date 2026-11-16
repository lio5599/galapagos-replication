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
    int blue = b0 << 1 | (b1 & 1);
    blue += b0 + (b1 >> 1);
    int green = g0 << 1 | (g1 & 1);
    green += g0 + (g1 >> 1);
    int red = r0 << 1 | (r1 & 1);
    red += r0 + (r1 >> 1);
    return (red / 3) * 1024 + (green / 3) * 32 + (blue / 3);
}


int main(){
    mix(0,0);
}
