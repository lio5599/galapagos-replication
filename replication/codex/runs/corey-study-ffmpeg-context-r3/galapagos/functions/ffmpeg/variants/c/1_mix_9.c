#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int b0 = c0 & 31;
    int b1 = c1 & 31;
    int g0 = (c0 & 992) / 32;
    int g1 = (c1 & 992) / 32;
    int blue = 2 * (b0 / 3) + b1 / 3
             + (2 * (b0 % 3) + b1 % 3) / 3;
    int green = 2 * (g0 / 3) + g1 / 3
              + (2 * (g0 % 3) + g1 % 3) / 3;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + green * 32 + blue;
}


int main(){
    mix(0,0);
}
