#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    int green = 2 * ((c0 & 0x03E0) >> 5) + ((c1 & 0x03E0) >> 5);
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int qb = (blue * 0xAAAB) >> 17;
    int qg = (green * 0xAAAB) >> 17;
    return red / 3 * 1024 + qg * 32 + qb;
}


int main(){
    mix(0,0);
}
