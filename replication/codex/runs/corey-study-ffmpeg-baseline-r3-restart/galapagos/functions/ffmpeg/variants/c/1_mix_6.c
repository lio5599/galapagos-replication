#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = 2 * ((c0 & 992) >> 5) + ((c1 & 992) >> 5);
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int blue_out = 0;
    int green_out = 0;

    while (blue >= 3) {
        blue -= 3;
        ++blue_out;
    }
    while (green >= 3) {
        green -= 3;
        ++green_out;
    }

    return (red / 3) * 1024 + green_out * 32 + blue_out;
}


int main(){
    mix(0,0);
}
