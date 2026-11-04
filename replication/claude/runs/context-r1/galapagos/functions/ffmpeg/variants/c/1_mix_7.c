#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = ((c0 & 0x001F) << 1) + (c1 & 0x001F);
    int green_scaled = ((c0 & 0x03E0) << 1) + (c1 & 0x03E0);
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    return red / 3 * 1024 + green_scaled / 96 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
