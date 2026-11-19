#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int a = negative ? -v : v;
    int limit = 2 * t;
    int r;

    if (a >= limit)
        a = 0;

    if (a < t)
        r = a;
    else
        r = limit - a;

    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
