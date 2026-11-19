#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Repeated addition replaces multiplication by 2.
    // Masked components stay nonnegative, and shifted red values remain signed.
    // The intermediate ranges and signed division match the reference.
    int b0 = c0 & 31;
    int b1 = c1 & 31;
    int g0 = (c0 & 992) >> 5;
    int g1 = (c1 & 992) >> 5;
    int r0 = c0 >> 10;
    int r1 = c1 >> 10;
    return ((r0 + r0 + r1) / 3) * 1024
         + ((g0 + g0 + g1) / 3) * 32
         + (b0 + b0 + b1) / 3;
}


int main(){
    mix(0,0);
}
