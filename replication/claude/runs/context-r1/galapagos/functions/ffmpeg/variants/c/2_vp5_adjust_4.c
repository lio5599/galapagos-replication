#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int sign = v < 0 ? -1 : 1;
    int a = sign * v;
    if (!(a < 2 * t))
        a = 0;
    if (a > t)
        a = 2 * t - a;
    return sign * a;
}


int main(){
    vp5_adjust(0,0);
}
