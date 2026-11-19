#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    unsigned int blue = 2u * ((unsigned int)c0 & 31u)
                      + ((unsigned int)c1 & 31u);
    unsigned int green = 2u * (((unsigned int)c0 & 992u) >> 5)
                       + (((unsigned int)c1 & 992u) >> 5);
    int red = 2 * (c0 >> 10) + (c1 >> 10);

    return (red / 3) * 1024
         + (int)((green / 3u) * 32u)
         + (int)(blue / 3u);
}


int main(){
    mix(0,0);
}
