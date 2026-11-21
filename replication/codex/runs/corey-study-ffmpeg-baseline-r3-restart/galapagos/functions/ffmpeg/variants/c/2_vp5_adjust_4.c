#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int sign = v < 0 ? -1 : 1;
    int magnitude = v * sign;
    int result;

    magnitude *= magnitude < 2 * t;
    result = magnitude - t;
    if (result < 0)
        result = -result;

    return sign * (t - result);
}


int main(){
    vp5_adjust(0,0);
}
