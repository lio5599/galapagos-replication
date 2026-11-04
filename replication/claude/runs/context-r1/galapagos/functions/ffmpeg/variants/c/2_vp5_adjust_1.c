#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    if (v >= 0) {
        if (v >= 2 * t)
            v = 0;
        if (v < t)
            return v;
        return 2 * t - v;
    }
    v = -v;
    if (v >= 2 * t)
        v = 0;
    if (v < t)
        return -v;
    return v - 2 * t;
}


int main(){
    vp5_adjust(0,0);
}
