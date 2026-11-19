#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    int r = 0;

    if (in == 0)
        return 64;
    if ((in & (uint64_t)0xFFFFFFFFULL) == 0) {
        r += 32;
        in >>= 32;
    }
    if ((in & 0xFFFF) == 0) {
        r += 16;
        in >>= 16;
    }
    if ((in & 0xFF) == 0) {
        r += 8;
        in >>= 8;
    }
    if ((in & 0xF) == 0) {
        r += 4;
        in >>= 4;
    }
    if ((in & 3) == 0) {
        r += 2;
        in >>= 2;
    }
    return r + ((in & 1) == 0);
}


int main(){
    ctz(0);
}
