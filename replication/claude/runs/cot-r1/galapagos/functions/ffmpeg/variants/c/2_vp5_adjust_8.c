#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // n = (v < 0). The factor (1 - 2n) is +1 or -1, used for both the abs and the sign.
    // a = |v|, c = a * (a < 2t), and r = t - |c - t| using a conditional negation.
    // Return (1 - 2n) * r, which equals the reference's xor/add sign restore.
    // Zero v gives n = 0, so the result r is kept unchanged, including 2t for t < 0.
    int n = v < 0;
    int f = 1 - 2 * n;
    int a = f * v;
    int c = a * (a < 2 * t);
    int d = c - t;
    int r = t - (d < 0 ? -d : d);
    return f * r;
}


int main(){
    vp5_adjust(0,0);
}
