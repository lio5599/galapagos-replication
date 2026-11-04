#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int a = v < 0 ? -v : v;
    int b, r;
    a = a < 2 * t ? a : 0;
    b = 2 * t - a;
    r = a < b ? a : b;
    return v < 0 ? 0 - r : r;
}


int main(){
    vp5_adjust(0,0);
}
