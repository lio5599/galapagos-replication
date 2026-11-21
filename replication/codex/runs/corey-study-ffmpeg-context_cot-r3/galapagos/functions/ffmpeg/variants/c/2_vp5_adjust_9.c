#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // For positive thresholds, subtract twice the excess above t from the magnitude.
    // This gives a below the peak and 2*t-a above it, with zero beyond the gate.
    // The excess is doubled only inside the gate, where it cannot overflow.
    // Nonpositive thresholds explicitly retain the reference's 2*t result.
    int negative = v < 0;
    int a = negative ? -v : v;
    int twice = 2 * t;
    int r;
    if (t <= 0) {
        r = twice;
    } else if (a >= twice) {
        r = 0;
    } else {
        int excess = a > t ? a - t : 0;
        r = a - 2 * excess;
    }
    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
