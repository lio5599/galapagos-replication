#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    uint64_t below = (in & ((uint64_t)0 - in)) - (uint64_t)1;
    int r = 0;

    while (below != 0) {
        below &= below - (uint64_t)1;
        ++r;
    }

    return r;
}


int main(){
    ctz(0);
}
