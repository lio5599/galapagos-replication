#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int s = v >> 31;
    int a = (v ^ s) - s;
    int mask = -(a < 2 * t);
    int d, sd, r;
    a &= mask;
    d = a - t;
    sd = d >> 31;
    d = (d ^ sd) - sd;
    r = t - d;
    return (r ^ s) - s;
}


int main(){
    vp5_adjust(0,0);
}
