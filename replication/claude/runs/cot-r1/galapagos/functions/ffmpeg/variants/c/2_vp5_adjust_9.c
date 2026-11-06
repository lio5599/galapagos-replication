#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Same steps as the reference, done in long long so no intermediate can overflow.
    // Wherever the reference is defined, every value equals the int computation.
    // The final result fits in int, so the cast back is exact.
    // Edge cases match: t <= 0 gives t - |t| (0 or 2t). The sign follows v, with 0 positive.
    long long a = v < 0 ? -(long long)v : (long long)v;
    long long tt = t;
    long long c = a < 2 * tt ? a : 0;
    long long d = c - tt;
    long long r = tt - (d < 0 ? -d : d);
    return (int)(v < 0 ? -r : r);
}


int main(){
    vp5_adjust(0,0);
}
