#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // After gating, the response is the minimum of b and its reflection 2*t-b.
    // This equals t - abs(b-t) on either side of the peak.
    // For nonpositive t, b is zero and the minimum is 2*t; boundary values also agree.
    // Matches wherever the 32-bit arithmetic-shift reference has defined arithmetic.
    int negative = v < 0;
    int a = negative ? -v : v;
    int twice = 2 * t;
    int b = a < twice ? a : 0;
    int reflected = twice - b;
    int r = b < reflected ? b : reflected;

    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
