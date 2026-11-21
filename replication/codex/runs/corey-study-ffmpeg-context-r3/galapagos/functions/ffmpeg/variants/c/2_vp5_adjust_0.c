#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    if (negative)
        v = -v;
    if (v >= 2 * t)
        v = 0;
    v -= t;
    if (v < 0)
        v = -v;
    v = t - v;
    return negative ? -v : v;
}


int main(){
    vp5_adjust(0,0);
}
