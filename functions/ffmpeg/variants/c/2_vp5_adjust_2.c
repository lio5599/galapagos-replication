#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int sign = (v < 0) ? -1 : 1;
    int a = v * sign;
    int d;
    a *= (a < 2 * t);
    d = a - t;
    if (d < 0)
        d = -d;
    return sign * (t - d);
}


int main(){
    vp5_adjust(0,0);
}
