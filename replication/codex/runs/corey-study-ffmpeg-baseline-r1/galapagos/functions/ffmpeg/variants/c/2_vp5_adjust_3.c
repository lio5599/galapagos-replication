#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int a = v < 0 ? -v : v;
    int r = t < 0 ? 2 * t :
            a >= 2 * t ? 0 :
            a < t ? a : 2 * t - a;

    return v < 0 ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
