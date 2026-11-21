#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Keep both reference magnitude folds but restore the original sign by branching.
    // On defined reference inputs, adding minus one then complementing equals negation.
    // Nonnegative inputs retain the folded result, even when that result is negative.
    int s1 = v >> 31;
    int s2;
    v = (v ^ s1) - s1;
    v *= v < 2 * t;
    v -= t;
    s2 = v >> 31;
    v = (v ^ s2) - s2;
    v = t - v;
    if (s1)
        return -v;
    return v;
}


int main(){
    vp5_adjust(0,0);
}
