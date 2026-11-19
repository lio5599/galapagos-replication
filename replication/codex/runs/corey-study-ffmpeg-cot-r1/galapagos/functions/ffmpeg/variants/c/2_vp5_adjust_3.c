#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Early returns select the same triangular segments without a final fold.
    // The rising segment returns v itself, including zero and a == t.
    // The endpoint a == 2*t and all larger magnitudes return zero.
    // Nonpositive t gives sign-restored 2*t, as in the reference.
    // Assumes arithmetic signed right shift and defined reference arithmetic.
    int negative = v < 0;
    int a, r;
    if (t <= 0) {
        r = 2 * t;
        return negative ? -r : r;
    }
    a = negative ? -v : v;
    if (a <= t)
        return v;
    if (a >= 2 * t)
        return 0;
    r = 2 * t - a;
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
