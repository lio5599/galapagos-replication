#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int blue = 2 * (c0 & 31) + (c1 & 31);
    int green = (2 * (c0 & 992) + (c1 & 992)) >> 5;
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int result = (red / 3) * 1024;
    while (green >= 3) {
        result += 32;
        green -= 3;
    }
    while (blue >= 3) {
        ++result;
        blue -= 3;
    }
    return result;
}


int main(){
    mix(0,0);
}
