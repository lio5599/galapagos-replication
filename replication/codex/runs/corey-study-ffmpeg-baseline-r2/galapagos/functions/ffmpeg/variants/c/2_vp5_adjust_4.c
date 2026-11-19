#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int sign = v >> 31;
    int magnitude = (v ^ sign) - sign;
    int delta;
    int result;

    magnitude = magnitude < 2 * t ? magnitude : 0;
    delta = magnitude - t;
    if (delta < 0)
        delta = -delta;
    result = t - delta;

    return (result + sign) ^ sign;
}


int main(){
    vp5_adjust(0,0);
}
