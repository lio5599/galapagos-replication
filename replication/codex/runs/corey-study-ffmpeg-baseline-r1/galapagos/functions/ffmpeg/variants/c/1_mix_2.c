#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int b0 = c0 & 31, b1 = c1 & 31;
    int g0 = (c0 & 992) >> 5, g1 = (c1 & 992) >> 5;
    int r0 = c0 >> 10, r1 = c1 >> 10;
    return ((2 * r0 + r1) / 3) * 1024
         + ((2 * g0 + g1) / 3) * 32
         + (2 * b0 + b1) / 3;
}


int main(){
    mix(0,0);
}
