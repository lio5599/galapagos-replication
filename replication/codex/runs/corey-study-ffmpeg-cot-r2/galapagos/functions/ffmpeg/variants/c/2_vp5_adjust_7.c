#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Handle nonpositive thresholds separately, then measure distance from the peak.
    // Within the positive cutoff, abs(t - a) equals the reference's abs(a - t).
    // Explicit cutoff handling preserves zero at equality and for all larger magnitudes.
    // Equivalence applies wherever the reference has defined 32-bit int behavior.
    int negative = v < 0;
    int a = negative ? -v : v;
    int d;
    int r;

    if (t <= 0) {
        r = 2 * t;
    } else {
        if (a >= 2 * t)
            return 0;
        d = t - a;
        r = t - (d >= 0 ? d : -d);
    }

    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
