#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Branches normalize and restore the input sign.
    // The central fold uses the reference's exact bitwise absolute value.
    // Keeping Boolean multiplication preserves every threshold boundary.
    // No additional overflowing arithmetic is introduced on defined inputs.
    int negative = v < 0;
    int a = v;
    int d;
    int sign;
    int r;
    if (negative)
        a = -a;
    a *= a < 2 * t;
    d = a - t;
    sign = d >> 31;
    d = (d ^ sign) - sign;
    r = t - d;
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
