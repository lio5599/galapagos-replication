#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    int r = 0;
    int i;

    for (i = 0; i < 64; ++i) {
        r += (in == 0);
        in <<= 1;
    }
    return r;
}


int main(){
    ctz(0);
}
