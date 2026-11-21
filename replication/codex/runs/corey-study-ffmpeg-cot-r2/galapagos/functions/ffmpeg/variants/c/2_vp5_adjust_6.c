#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Test the rising segment first, then the falling segment, using early returns.
    // The first segment is possible only for nonnegative t and includes the peak.
    // Remaining inputs give zero unless t is negative, when the reference gives signed 2*t.
    // Equivalence applies wherever the reference has defined 32-bit int behavior.
    int negative = v < 0;
    int a = negative ? -v : v;
    int r;

    if (a <= t)
        return v;

    if (a < 2 * t) {
        r = 2 * t - a;
        return negative ? -r : r;
    }

    r = t < 0 ? 2 * t : 0;
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
