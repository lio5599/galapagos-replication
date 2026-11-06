#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Blue and green use x/3 == (x*21846)>>16 for 0 <= x <= 93.
    // The error is about 1e-5*x, well below 1/3, so the floor is exact.
    // Red is computed in signed form and combined into the high field with OR,
    // which is valid because red/3*1024 has its low 10 bits zero.
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int low = (((green * 21846) >> 16) << 5) | ((blue * 21846) >> 16);
    return (red / 3 * 1024) | low;
}


int main(){
    mix(0,0);
}
