#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int neg = v < 0;
    int a = neg ? -v : v;
    int d;
    a = a * (a < 2 * t);
    d = t - a;
    d = d > 0 ? d : -d;
    return neg ? d - t : t - d;
}


int main(){
    vp5_adjust(0,0);
}
