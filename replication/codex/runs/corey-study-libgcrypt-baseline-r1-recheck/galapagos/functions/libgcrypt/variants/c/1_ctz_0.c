#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    int i;

    for (i = 0; i < 64; ++i)
        if ((in >> i) & (uint64_t)1)
            return i;

    return 64;
}


int main(){
    ctz(0);
}
