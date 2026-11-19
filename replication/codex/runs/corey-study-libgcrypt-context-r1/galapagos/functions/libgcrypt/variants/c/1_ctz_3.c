#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    uint64_t mask = 1;
    int r = 0;

    while (mask != 0 && (in & mask) == 0) {
        ++r;
        mask <<= 1;
    }
    return r;
}


int main(){
    ctz(0);
}
