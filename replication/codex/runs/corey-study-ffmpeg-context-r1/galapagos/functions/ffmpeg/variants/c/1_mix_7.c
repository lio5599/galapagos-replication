#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int blue_part = (blue / 3) << 0;
    int green_part = (green / 3) << 5;
    int red_part = (red / 3) * 1024;
    return red_part + green_part + blue_part;
}


int main(){
    mix(0,0);
}
