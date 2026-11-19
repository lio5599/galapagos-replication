#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int negative = v < 0;
    int a = negative ? -v : v;
    int twice = 2 * t;
    int r = t <= 0 ? twice
          : a >= twice ? 0
          : a <= t ? a
          : twice - a;

    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
