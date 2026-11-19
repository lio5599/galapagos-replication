#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int magnitude = v < 0 ? -v : v;
    int delta = (magnitude < 2 * t ? magnitude : 0) - t;
    int result = delta < 0 ? t + delta : t - delta;

    return v < 0 ? -result : result;
}


int main(){
    vp5_adjust(0,0);
}
