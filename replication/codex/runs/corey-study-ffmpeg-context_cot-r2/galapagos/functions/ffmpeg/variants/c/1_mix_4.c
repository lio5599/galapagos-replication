#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Uses the identity 2*a+b = 3*a+(b-a) for each extracted component.
    // Masking and shifting bound every intermediate, including signed red.
    // Division is still performed only after forming the exact weighted sum.
    int b0 = c0 & 31;
    int b1 = c1 & 31;
    int g0 = (c0 & 992) >> 5;
    int g1 = (c1 & 992) >> 5;
    int r0 = c0 >> 10;
    int r1 = c1 >> 10;
    int blue = 3 * b0 + (b1 - b0);
    int green = 3 * g0 + (g1 - g0);
    int red = 3 * r0 + (r1 - r0);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
