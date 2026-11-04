#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    unsigned int m = (unsigned int)(v >> 31);
    unsigned int a = ((unsigned int)v ^ m) - m;
    unsigned int r;
    if ((int)a >= 2 * t)
        a = 0;
    r = (int)a < t ? a : 2u * (unsigned int)t - a;
    return (int)((r ^ m) - m);
}


int main(){
    vp5_adjust(0,0);
}
