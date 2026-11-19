#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    int r = 0;

    if (in == 0)
        return 64;

    while ((in & 15) == 0) {
        in >>= 4;
        r += 4;
    }

    switch (in & 15) {
    case 8:
        return r + 3;
    case 4:
    case 12:
        return r + 2;
    case 2:
    case 6:
    case 10:
    case 14:
        return r + 1;
    default:
        return r;
    }
}


int main(){
    ctz(0);
}
