#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    int r = 0;
    int i;

    in |= in << 1;
    in |= in << 2;
    in |= in << 4;
    in |= in << 8;
    in |= in << 16;
    in |= in << 32;

    for (i = 0; i < 64; ++i) {
        r += (int)((in & 1) ^ 1);
        in >>= 1;
    }
    return r;
}


int main(){
    ctz(0);
}
