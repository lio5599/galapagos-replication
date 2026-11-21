#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int magnitude = negative ? -v : v;
    int delta, result;

    if (magnitude >= 2 * t)
        magnitude = 0;

    delta = magnitude - t;
    result = t - (delta < 0 ? -delta : delta);
    return negative ? -result : result;
}


int main(){
    vp5_adjust(0,0);
}
