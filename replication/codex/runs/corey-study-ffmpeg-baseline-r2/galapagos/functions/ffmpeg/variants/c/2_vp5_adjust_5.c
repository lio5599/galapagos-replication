#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int magnitude = negative ? -v : v;
    int mask;
    int delta;
    int result;

    mask = -(magnitude < 2 * t);
    magnitude &= mask;
    delta = magnitude - t;
    mask = delta >> 31;
    result = t - ((delta ^ mask) - mask);

    return negative ? -result : result;
}


int main(){
    vp5_adjust(0,0);
}
