#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int neg = v < 0;
    int a = neg ? -v : v;
    int d, r;
    a *= a < 2 * t;
    d = a > t ? a - t : t - a;
    r = t - d;
    return neg ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
