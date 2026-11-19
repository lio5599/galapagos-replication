#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int channels[3];

    channels[0] = 2 * (c0 & 0x001F) + (c1 & 0x001F);
    channels[1] = (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5;
    channels[2] = 2 * (c0 >> 10) + (c1 >> 10);

    channels[0] /= 3;
    channels[1] /= 3;
    channels[2] /= 3;

    return channels[2] * 1024 + channels[1] * 32 + channels[0];
}


int main(){
    mix(0,0);
}
