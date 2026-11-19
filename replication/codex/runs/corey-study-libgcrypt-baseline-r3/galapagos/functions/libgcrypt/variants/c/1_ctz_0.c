#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    int r = 0;
    if (in == 0)
        return 64;

    while ((in & 1) == 0) {
        ++r;
        in >>= 1;
    }
    return r;
}


int main(){
    ctz(0);
}
