#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int a, d, r;
    if (v < 0) {
        a = -v;
        if (a >= 2 * t)
            a = 0;
        d = a - t;
        if (d < 0)
            d = -d;
        r = d - t;
    } else {
        a = v;
        if (a >= 2 * t)
            a = 0;
        d = a - t;
        if (d < 0)
            d = -d;
        r = t - d;
    }
    return r;
}


int main(){
    vp5_adjust(0,0);
}
