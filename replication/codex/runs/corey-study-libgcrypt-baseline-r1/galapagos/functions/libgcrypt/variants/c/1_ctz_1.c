#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    int r = 0;

    if (in == 0)
        return 64;

    while ((in & (uint64_t)1) == 0) {
        in >>= 1;
        ++r;
    }

    return r;
}


int main(){
    ctz(0);
}
