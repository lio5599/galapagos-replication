#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Handles a rejected magnitude directly as t minus absolute value of t.
    // That value is zero for nonnegative t and 2*t for negative t.
    // Accepted magnitudes use the original distance formula, including equality at t.
    int negative = v < 0;
    int a = negative ? -v : v;
    int twice = 2 * t;
    int result;
    if (a >= twice) {
        result = t < 0 ? twice : 0;
    } else {
        int d = a - t;
        result = t - (d < 0 ? -d : d);
    }
    return negative ? -result : result;
}


int main(){
    vp5_adjust(0,0);
}
