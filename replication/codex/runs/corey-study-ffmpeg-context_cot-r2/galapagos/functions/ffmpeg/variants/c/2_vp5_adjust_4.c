#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Expands the gated fold into its three piecewise regions.
    // A rejected magnitude produces t - abs(t), not always zero.
    // Equality at either boundary matches the reference exactly.
    // Selected arithmetic is representable on reference-defined inputs.
    int a = v < 0 ? -v : v;
    int twice = 2 * t;
    int r;
    if (a >= twice)
        r = t < 0 ? twice : 0;
    else if (a <= t)
        r = a;
    else
        r = twice - a;
    return v < 0 ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
