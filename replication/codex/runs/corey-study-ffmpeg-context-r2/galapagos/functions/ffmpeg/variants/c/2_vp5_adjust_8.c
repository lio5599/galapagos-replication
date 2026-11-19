#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int a = negative ? -v : v;
    int twice = 2 * t;

    if (t <= 0)
        return negative ? -twice : twice;
    if (a >= twice)
        return 0;
    if (a <= t)
        return v;

    a = twice - a;
    return negative ? -a : a;
}


int main(){
    vp5_adjust(0,0);
}
