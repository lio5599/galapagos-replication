#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Keep the reference's multiplicative gate, then reflect values above t.
    // This reflection is exactly t - abs(a - t), including equality at t.
    // At or beyond 2*t the gate yields zero; negative t then reflects zero to 2*t.
    // Equivalence applies wherever the reference has defined 32-bit int behavior.
    int negative = v < 0;
    int a = negative ? -v : v;
    int r = a * (a < 2 * t);

    if (r > t)
        r = 2 * t - r;

    return negative ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
