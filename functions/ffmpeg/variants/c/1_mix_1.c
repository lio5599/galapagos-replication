#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int b0 = c0 & 0x1F, b1 = c1 & 0x1F;
    int g0 = (c0 >> 5) & 0x1F, g1 = (c1 >> 5) & 0x1F;
    int r0 = c0 >> 10, r1 = c1 >> 10;
    int blue = 2 * b0 + b1;
    int green = 2 * g0 + g1;
    int red = 2 * r0 + r1;
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
