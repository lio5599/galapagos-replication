#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Computes the sign-restored value t - abs((abs(v) < 2*t ? abs(v) : 0) - t).
    // Branches implement both absolute values and the magnitude gate.
    // Negative thresholds are preserved rather than treated as zero.
    // All negations are valid whenever the reference has defined behavior.
    int negative = v < 0;
    int a = negative ? -v : v;
    int d;
    int r;
    if (a >= 2 * t)
        a = 0;
    d = a - t;
    if (d < 0)
        d = -d;
    r = t - d;
    if (negative)
        r = -r;
    return r;
}


int main(){
    vp5_adjust(0,0);
}
