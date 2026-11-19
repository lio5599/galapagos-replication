#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    uint64_t x = (~in) & (in - UINT64_C(1));
    int r = 0;

    while (x != 0) {
        x &= x - UINT64_C(1);
        ++r;
    }
    return r;
}


int main(){
    ctz(0);
}
