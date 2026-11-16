#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int abs_v;
    int sign_bit;
    if (v < 0) {
        abs_v = -v;
        sign_bit = 1;
    } else {
        abs_v = v;
        sign_bit = 0;
    }
    int clamped = (abs_v < 2 * t) ? abs_v : 0;
    int diff = clamped - t;
    int abs_diff = (diff < 0) ? -diff : diff;
    int result = t - abs_diff;
    if (sign_bit)
        result = -result;
    return result;
}


int main(){
    vp5_adjust(0,0);
}
