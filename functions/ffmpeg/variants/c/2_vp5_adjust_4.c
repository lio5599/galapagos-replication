#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int s1 = v >> 31;
    int a = (v + s1) ^ s1;
    int d, s2;
    if (!(a < 2 * t))
        a = 0;
    d = a - t;
    s2 = d >> 31;
    d = (d + s2) ^ s2;
    a = t - d;
    return (a + s1) ^ s1;
}


int main(){
    vp5_adjust(0,0);
}
