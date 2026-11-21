#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // For positive t, classify the magnitude by how many triangle boundaries it crosses.
    // Classes zero, one, and two select the rising segment, falling segment, and zero.
    // Equality at t selects the peak; equality at 2*t selects zero.
    // Nonpositive t is handled separately; defined-reference arithmetic is assumed.
    int negative = v < 0;
    int a = negative ? -v : v;
    int r;

    if (t <= 0) {
        r = 2 * t;
    } else {
        switch ((a > t) + (a >= 2 * t)) {
        case 0:
            r = a;
            break;
        case 1:
            r = 2 * t - a;
            break;
        default:
            r = 0;
            break;
        }
    }

    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
