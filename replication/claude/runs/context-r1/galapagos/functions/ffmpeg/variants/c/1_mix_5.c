#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int r0 = (c0 & ~0x3FF) / 1024;
    int r1 = (c1 & ~0x3FF) / 1024;
    int red = 2 * r0 + r1;
    int green = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) / 32;
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    return red / 3 * 1024 + green / 3 * 32 + blue / 3;
}


int main(){
    mix(0,0);
}
