#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = ((c0 & 31) << 1) + (c1 & 31);
    int green = (((c0 & 992) >> 5) << 1) + ((c1 & 992) >> 5);
    int red = 2 * (c0 >> 10) + (c1 >> 10);

    blue /= 3;
    green /= 3;
    red /= 3;

    return red * 1024 + green * 32 + blue;
}


int main(){
    mix(0,0);
}
