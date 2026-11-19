#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue0 = c0 & 0x001F;
    int blue1 = c1 & 0x001F;
    int green0 = (c0 & 0x03E0) >> 5;
    int green1 = (c1 & 0x03E0) >> 5;
    int red0 = c0 >> 10;
    int red1 = c1 >> 10;

    return ((red0 + red0 + red1) / 3) * 1024
         + ((green0 + green0 + green1) / 3) * 32
         + (blue0 + blue0 + blue1) / 3;
}


int main(){
    mix(0,0);
}
