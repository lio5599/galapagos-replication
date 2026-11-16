#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int abs_v = (v >= 0) ? v : -v;
    int sign = (v < 0) ? 1 : 0;
    abs_v *= abs_v < 2 * t;
    abs_v -= t;
    int abs_diff = (abs_diff >= 0) ? abs_diff : -abs_diff;
    int result = t - abs_diff;
    if (sign)
        result = -result;
    return result;
}


int main(){
    vp5_adjust(0,0);
}
