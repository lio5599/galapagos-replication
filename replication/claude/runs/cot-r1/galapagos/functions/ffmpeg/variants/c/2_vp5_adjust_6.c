#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // With c clamped as in the reference, t - |c - t| is c if c <= t, else 2t - c.
    // When t < 0, c is 0 > t, so the result is 2t - 0 = 2t, matching t - |t|.
    // When t == 0, c is 0 <= t, so the result is 0.
    // The sign is applied to the result exactly as the reference applies s1.
    int a = v >= 0 ? v : -v;
    int c = (a < 2 * t) ? a : 0;
    int r = (c <= t) ? c : 2 * t - c;
    return v >= 0 ? r : -r;
}


int main(){
    vp5_adjust(0,0);
}
