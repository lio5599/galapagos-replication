#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = (c0 & 31) + (c1 & 31);
    int green = (c0 & 0x03E0) + (c1 & 0x03E0);
    int red = (c0 >> 10) + (c1 >> 10);
    blue += c0 & 31;
    green += c0 & 0x03E0;
    red += c0 >> 10;
    green >>= 5;
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
