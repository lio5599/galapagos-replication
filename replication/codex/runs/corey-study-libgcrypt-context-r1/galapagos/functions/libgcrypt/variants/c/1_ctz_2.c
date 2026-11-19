#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    int r = 0;
    while (r < 64 && (in & 1) == 0) {
        in >>= 1;
        ++r;
    }
    return r;
}


int main(){
    ctz(0);
}
