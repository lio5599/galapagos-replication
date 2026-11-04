#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int s = -(v < 0);
    int a = (v ^ s) - s;
    int keep = -(a < 2 * t);
    int d, m;
    a &= keep;
    d = a - t;
    m = -(d < 0);
    d = (d ^ m) - m;
    a = t - d;
    return (a ^ s) - s;
}


int main(){
    vp5_adjust(0,0);
}
