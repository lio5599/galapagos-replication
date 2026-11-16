#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = (c0 & 0x1F) + (c0 & 0x1F) + (c1 & 0x1F);
    int green = ((c0 & 0x3E0) + (c0 & 0x3E0) + (c1 & 0x3E0)) >> 5;
    int red = (c0 >> 10) + (c0 >> 10) + (c1 >> 10);
    return (red / 3) * 1024 + (green / 3) * 32 + (blue / 3);
}


int main(){
    mix(0,0);
}
