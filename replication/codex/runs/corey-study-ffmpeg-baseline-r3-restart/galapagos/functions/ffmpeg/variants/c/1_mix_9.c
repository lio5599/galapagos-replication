#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = c1 & 31;
    int green = (c1 & 992) >> 5;
    int red = c1 >> 10;

    blue += 2 * (c0 & 31);
    green += 2 * ((c0 & 992) >> 5);
    red += 2 * (c0 >> 10);

    int result = (red / 3) * 1024;
    result += (green / 3) * 32;
    result += blue / 3;
    return result;
}


int main(){
    mix(0,0);
}
