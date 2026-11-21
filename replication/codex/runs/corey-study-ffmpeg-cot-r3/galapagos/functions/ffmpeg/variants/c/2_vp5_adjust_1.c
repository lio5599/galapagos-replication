#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Keep the reference's magnitude gate, then express both absolute values conditionally.
    // The gated magnitude b gives the response t - abs(b-t).
    // Equality at 2*t gates to zero; nonpositive t gates every magnitude to zero.
    // Matches wherever the 32-bit arithmetic-shift reference has defined arithmetic.
    int negative = v < 0;
    int a = negative ? -v : v;
    int b = a * (a < 2 * t);
    int d = b - t;
    int r = t - (d < 0 ? -d : d);

    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
