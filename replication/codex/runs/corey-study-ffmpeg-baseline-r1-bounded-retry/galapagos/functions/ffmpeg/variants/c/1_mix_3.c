#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    return ((2 * (c0 >> 10) + (c1 >> 10)) / 3) * 1024
         + ((2 * ((c0 & 992) / 32) + (c1 & 992) / 32) / 3) * 32
         + (2 * (c0 & 31) + (c1 & 31)) / 3;
}


int main(){
    mix(0,0);
}
