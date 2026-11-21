#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Fold the distance from t, then clamp the result for positive thresholds.
    // Outside the positive triangular support the fold is negative and becomes zero.
    // Nonpositive thresholds are handled separately because their reference result is 2*t.
    // The distance arithmetic is representable on every defined reference input.
    int negative = v < 0;
    int a = negative ? -v : v;
    int r;
    if (t <= 0) {
        r = 2 * t;
    } else {
        int distance = a - t;
        if (distance < 0)
            distance = -distance;
        r = t - distance;
        if (r < 0)
            r = 0;
    }
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
