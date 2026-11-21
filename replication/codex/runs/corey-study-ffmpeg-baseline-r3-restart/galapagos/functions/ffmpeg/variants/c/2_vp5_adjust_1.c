#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    int magnitude = v < 0 ? -v : v;
    int delta = (magnitude < 2 * t ? magnitude : 0) - t;
    int result = t - (delta >= 0 ? delta : -delta);

    return v >= 0 ? result : -result;
}


int main(){
    vp5_adjust(0,0);
}
