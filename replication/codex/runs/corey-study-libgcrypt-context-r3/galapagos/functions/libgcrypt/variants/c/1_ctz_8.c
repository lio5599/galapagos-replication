#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    int r = 0;

    if (in == 0)
        return 64;

    while ((in & UINT64_C(0xf)) == 0) {
        r += 4;
        in >>= 4;
    }

    if ((in & 1) != 0)
        return r;
    if ((in & 2) != 0)
        return r + 1;
    if ((in & 4) != 0)
        return r + 2;
    return r + 3;
}


int main(){
    ctz(0);
}
