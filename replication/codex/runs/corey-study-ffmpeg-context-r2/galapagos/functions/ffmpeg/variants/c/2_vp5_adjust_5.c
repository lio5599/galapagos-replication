#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int a = negative ? -v : v;
    int twice = 2 * t;

    if (!(a < twice))
        a = 0;
    if (a > t)
        a = twice - a;

    return negative ? -a : a;
}


int main(){
    vp5_adjust(0,0);
}
