#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = (c0 & 31) * 2 + (c1 & 31);
    int green = ((c0 & 0x3E0) * 2 + (c1 & 0x3E0)) >> 5;
    int red = (c0 >> 10) * 2 + (c1 >> 10);
    return (red / 3) << 10 + (green / 3) << 5 + (blue / 3);
}


int main(){
    mix(0,0);
}
