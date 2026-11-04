#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = (c1 & 0x001F) + 2 * (c0 & 0x001F);
    int green = ((c1 & 0x03E0) + 2 * (c0 & 0x03E0)) >> 5;
    int red = (c1 >> 10) + 2 * (c0 >> 10);
    int low = green / 3 * 32 + blue / 3;
    int high = red / 3 * 1024;
    return high + low;
}


int main(){
    mix(0,0);
}
