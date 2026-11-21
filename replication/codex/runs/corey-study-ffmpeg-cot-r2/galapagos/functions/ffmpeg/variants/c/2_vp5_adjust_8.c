#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Express the reference as sequential conditional negations and a cutoff branch.
    // Each conditional negation replaces the corresponding sign-mask absolute value.
    // The strict cutoff, zero input, and nonpositive thresholds retain their original behavior.
    // Equivalence applies wherever the reference has defined 32-bit int behavior.
    int negative = v < 0;

    if (negative)
        v = -v;
    if (v >= 2 * t)
        v = 0;
    v -= t;
    if (v < 0)
        v = -v;
    v = t - v;
    if (negative)
        v = -v;

    return v;
}


int main(){
    vp5_adjust(0,0);
}
