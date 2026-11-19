#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int sign = v >> 31;
    int a = (v ^ sign) - sign;
    int d, mask, r;

    a &= -(a < 2 * t);
    d = a - t;
    mask = -(d < 0);
    r = t - ((d ^ mask) - mask);

    return (r + sign) ^ sign;
}


int main(){
    vp5_adjust(0,0);
}
