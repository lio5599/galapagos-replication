#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int distance;
    if (negative)
        v = -v;
    v *= v < 2 * t;
    distance = v - t;
    if (distance < 0)
        distance = -distance;
    v = t - distance;
    return negative ? -v : v;
}


int main(){
    vp5_adjust(0,0);
}
