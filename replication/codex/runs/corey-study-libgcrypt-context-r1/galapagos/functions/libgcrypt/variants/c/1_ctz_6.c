#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    uint64_t bits = ~in & (in - UINT64_C(1));
    int r = 0;
    int i;

    for (i = 0; i < 64; ++i) {
        r += (int)(bits & 1);
        bits >>= 1;
    }
    return r;
}


int main(){
    ctz(0);
}
