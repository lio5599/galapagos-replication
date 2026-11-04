#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int a = v < 0 ? -v : v;
    int at = t < 0 ? -t : t;
    int d, r;
    if (a < 2 * t)
        d = a > t ? a - t : t - a;
    else
        d = at;
    r = t - d;
    return v < 0 ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
