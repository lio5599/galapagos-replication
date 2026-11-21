#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Express both absolute values and the magnitude gate with conditional expressions.
    // The final negation equals the reference's sign restoration on its defined inputs.
    // No positive-threshold assumption is made, so negative thresholds are preserved.
    int negative = v < 0;
    int a = negative ? -v : v;
    int b = (a < 2 * t ? a : 0) - t;
    int r = t - (b < 0 ? -b : b);
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
