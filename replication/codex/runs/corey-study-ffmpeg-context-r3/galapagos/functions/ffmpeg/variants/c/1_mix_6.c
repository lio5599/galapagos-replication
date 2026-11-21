#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int b0 = c0 & 31;
    int b1 = c1 & 31;
    int g0 = (c0 & 992) >> 5;
    int g1 = (c1 & 992) >> 5;
    int r0 = c0 >> 10;
    int r1 = c1 >> 10;
    int blue = b0 + (b0 + b1);
    int green = g0 + (g0 + g1);
    int red = r0 + (r0 + r1);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
