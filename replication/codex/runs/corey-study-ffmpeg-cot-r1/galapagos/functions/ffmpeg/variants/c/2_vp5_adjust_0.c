#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Computes sign-restored t - abs((abs(v) < 2*t ? abs(v) : 0) - t).
    // Branches replace the reference's two absolute-value operations.
    // Zero is treated as nonnegative; equality at 2*t selects zero.
    // Nonpositive t also selects zero before the inner subtraction.
    // Equivalence assumes arithmetic signed right shift and no undefined
    // signed arithmetic in the reference, including its negation of INT_MIN.
    int negative = v < 0;
    int a = negative ? -v : v;
    int d, r;
    if (a >= 2 * t)
        a = 0;
    d = a - t;
    if (d < 0)
        d = -d;
    r = t - d;
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
