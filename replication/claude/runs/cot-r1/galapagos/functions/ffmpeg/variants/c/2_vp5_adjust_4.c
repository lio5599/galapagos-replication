#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Identity: t - |c - t| == min(c, 2t - c), because one term is c and the other is 2t - c.
    // c = |v| when |v| < 2t, otherwise 0. With t < 0 and c = 0, min(0, 2t) = 2t, as required.
    // With t == 0 the result is 0. Subtracting c from 2t cannot overflow when 2t is defined.
    // The final sign follows v, with zero treated as positive.
    int a = v < 0 ? -v : v;
    int c = a < 2 * t ? a : 0;
    int r = c < 2 * t - c ? c : 2 * t - c;
    return v < 0 ? -r : r;
}


int main(){
    vp5_adjust(0,0);
}
