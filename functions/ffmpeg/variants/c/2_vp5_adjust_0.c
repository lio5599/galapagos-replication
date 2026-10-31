#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int neg = v < 0;
    int a = neg ? -v : v;
    int d;
    if (a >= 2 * t)
        a = 0;
    d = a - t;
    if (d < 0)
        d = -d;
    a = t - d;
    return neg ? -a : a;
}


int main(){
    vp5_adjust(0,0);
}
