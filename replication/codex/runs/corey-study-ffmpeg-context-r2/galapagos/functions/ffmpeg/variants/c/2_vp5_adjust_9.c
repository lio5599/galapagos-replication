#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int sign = v >> 31;
    int a = (v ^ sign) - sign;
    int d;
    int mask;

    a = a < 2 * t ? a : 0;
    d = a - t;
    mask = d >> 31;
    d = (d + mask) ^ mask;
    a = t - d;

    return (a + sign) ^ sign;
}


int main(){
    vp5_adjust(0,0);
}
