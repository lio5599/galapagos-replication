#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    uint64_t bits = (in & (UINT64_C(0) - in)) - UINT64_C(1);
    int r = 0;

    while (bits != 0) {
        bits &= bits - UINT64_C(1);
        ++r;
    }
    return r;
}


int main(){
    ctz(0);
}
