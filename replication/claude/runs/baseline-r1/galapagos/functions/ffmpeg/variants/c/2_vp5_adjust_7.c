#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int a = v;
    int r;
    if (a < 0)
        a = -a;
    if (a < t)
        r = a;
    else if (a < 2 * t)
        r = 2 * t - a;
    else
        r = t - (t < 0 ? -t : t);
    return (v < 0) ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
