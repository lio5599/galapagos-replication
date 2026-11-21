#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Gate the magnitude, then expand t - abs(b-t) into its two linear pieces.
    // For b < t the result is b; otherwise it is 2*t-b.
    // This includes t <= 0, where b is zero and the result is 2*t.
    // Matches wherever the 32-bit arithmetic-shift reference has defined arithmetic.
    int negative = v < 0;
    int a = negative ? -v : v;
    int b = a < 2 * t ? a : 0;
    int r = b < t ? b : 2 * t - b;

    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
