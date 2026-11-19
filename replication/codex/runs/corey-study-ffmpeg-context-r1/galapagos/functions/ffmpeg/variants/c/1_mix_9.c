#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = (c0 & 31);
    int green = (c0 & 0x03E0);
    int red = c0 >> 10;
    blue *= 2;
    green *= 2;
    red *= 2;
    blue += c1 & 31;
    green += c1 & 0x03E0;
    red += c1 >> 10;
    blue /= 3;
    green = (green >> 5) / 3;
    red /= 3;
    red *= 1024;
    green *= 32;
    return red + green + blue;
}


int main(){
    mix(0,0);
}
