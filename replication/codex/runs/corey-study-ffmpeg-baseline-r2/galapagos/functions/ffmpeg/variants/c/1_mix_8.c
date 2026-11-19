#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = (c0 & 0x001F) << 1;
    int green = (c0 & 0x03E0) << 1;
    int red = (c0 >> 10) * 2;

    blue += c1 & 0x001F;
    green += c1 & 0x03E0;
    red += c1 >> 10;

    return (red / 3) * 1024
         + ((green >> 5) / 3) * 32
         + blue / 3;
}


int main(){
    mix(0,0);
}
