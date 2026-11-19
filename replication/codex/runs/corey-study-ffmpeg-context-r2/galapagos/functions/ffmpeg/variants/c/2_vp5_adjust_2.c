#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int sign = v >> 31;
    int a = (v ^ sign) - sign;
    int r;

    if (t <= 0)
        r = 2 * t;
    else if (a >= 2 * t)
        r = 0;
    else if (a <= t)
        r = a;
    else
        r = 2 * t - a;

    return (r + sign) ^ sign;
}


int main(){
    vp5_adjust(0,0);
}
