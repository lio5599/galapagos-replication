#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Evaluate the triangular function directly instead of performing two folds.
    // For nonpositive t the gate always clears the magnitude, yielding 2*t.
    // For positive t the three regions yield a, 2*t-a, and zero respectively.
    // The reference excludes overflowing magnitude and doubled-threshold arithmetic.
    int negative = v < 0;
    int a = negative ? -v : v;
    int twice = 2 * t;
    int r;
    if (t <= 0)
        r = twice;
    else if (a >= twice)
        r = 0;
    else if (a <= t)
        r = a;
    else
        r = twice - a;
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
