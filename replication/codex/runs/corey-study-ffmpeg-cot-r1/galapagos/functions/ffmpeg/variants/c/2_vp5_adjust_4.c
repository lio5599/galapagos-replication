#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // For positive t, the triangle is max(0, min(a, 2*t - a)).
    // Its minimum switches at a == t and reaches zero at a == 2*t.
    // Nonpositive t must instead retain the reference's 2*t result.
    // Assumes arithmetic signed right shift and defined reference arithmetic.
    int negative = v < 0;
    int a = negative ? -v : v;
    int r;
    if (t <= 0) {
        r = 2 * t;
    } else {
        int descending = 2 * t - a;
        r = a < descending ? a : descending;
        if (r < 0)
            r = 0;
    }
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
