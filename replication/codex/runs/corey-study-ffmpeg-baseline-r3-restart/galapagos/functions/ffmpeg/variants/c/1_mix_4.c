#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int a[3] = { c0 & 31, (c0 & 992) >> 5, c0 >> 10 };
    int b[3] = { c1 & 31, (c1 & 992) >> 5, c1 >> 10 };

    for (int i = 0; i < 3; ++i)
        a[i] = (2 * a[i] + b[i]) / 3;

    return a[2] * 1024 + a[1] * 32 + a[0];
}


int main(){
    mix(0,0);
}
