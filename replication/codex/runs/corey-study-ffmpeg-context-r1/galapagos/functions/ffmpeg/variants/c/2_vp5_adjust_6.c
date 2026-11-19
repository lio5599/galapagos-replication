#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int magnitude = negative ? -v : v;
    int twice = 2 * t;
    int result;

    if (t <= 0)
        result = twice;
    else if (magnitude >= twice)
        result = 0;
    else if (magnitude <= t)
        result = magnitude;
    else
        result = twice - magnitude;

    return negative ? -result : result;
}


int main(){
    vp5_adjust(0,0);
}
