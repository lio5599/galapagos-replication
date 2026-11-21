#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int magnitude = negative ? -v : v;

    magnitude = magnitude < 2 * t ? magnitude : 0;
    if (magnitude > t)
        magnitude = t - (magnitude - t);

    if (negative)
        magnitude = -magnitude;
    return magnitude;
}


int main(){
    vp5_adjust(0,0);
}
