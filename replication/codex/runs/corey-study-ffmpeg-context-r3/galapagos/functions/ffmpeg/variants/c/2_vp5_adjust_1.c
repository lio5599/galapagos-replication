#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int s1 = v >> 31;
    v = s1 ? -v : v;
    v = v < 2 * t ? v : 0;
    v -= t;
    v = v < 0 ? -v : v;
    v = t - v;
    return s1 ? -v : v;
}


int main(){
    vp5_adjust(0,0);
}
