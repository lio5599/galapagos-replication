#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int result = (2 * (c0 >> 10) + (c1 >> 10)) / 3;
    result *= 32;
    result += (2 * ((c0 & 992) >> 5) + ((c1 & 992) >> 5)) / 3;
    result *= 32;
    result += (2 * (c0 & 31) + (c1 & 31)) / 3;
    return result;
}


int main(){
    mix(0,0);
}
