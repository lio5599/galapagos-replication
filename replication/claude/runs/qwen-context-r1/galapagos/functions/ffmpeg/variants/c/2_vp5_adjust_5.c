#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int abs_v = v;
    int neg = 0;
    if (v < 0) {
        abs_v = -v;
        neg = 1;
    }
    if (abs_v >= 2 * t)
        abs_v = 0;
    int diff = abs_v - t;
    if (diff < 0)
        diff = -diff;
    int result = t - diff;
    if (neg)
        result = -result;
    return result;
}


int main(){
    vp5_adjust(0,0);
}
