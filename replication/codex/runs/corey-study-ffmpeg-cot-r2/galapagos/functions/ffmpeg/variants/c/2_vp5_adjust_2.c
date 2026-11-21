#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // After gating, expand t - abs(a - t) into its two linear branches.
    // At a == t both branches agree; at the cutoff the gated value becomes zero.
    // For negative t the gated zero selects 2*t, including when the input is zero.
    // Equivalence applies wherever the reference has defined 32-bit int behavior.
    int s = v >> 31;
    int a = (v ^ s) - s;
    int r;

    a = a < 2 * t ? a : 0;
    r = a <= t ? a : 2 * t - a;

    return (r + s) ^ s;
}


int main(){
    vp5_adjust(0,0);
}
