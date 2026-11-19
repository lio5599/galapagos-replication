#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int channels[3];
    int result = 0;
    int i;
    channels[0] = 2 * (c0 & 31) + (c1 & 31);
    channels[1] = (2 * (c0 & 992) + (c1 & 992)) >> 5;
    channels[2] = 2 * (c0 >> 10) + (c1 >> 10);
    for (i = 2; i >= 0; --i)
        result = result * 32 + channels[i] / 3;
    return result;
}


int main(){
    mix(0,0);
}
