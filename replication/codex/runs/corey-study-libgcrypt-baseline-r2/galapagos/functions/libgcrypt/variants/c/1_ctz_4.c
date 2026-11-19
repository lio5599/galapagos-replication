#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    uint64_t bits = (in & (uint64_t)(~in + 1)) - 1;
    int r = 0;

    while (bits != 0) {
        bits &= bits - 1;
        ++r;
    }

    return r;
}


int main(){
    ctz(0);
}
