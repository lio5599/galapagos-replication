#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    int r = 64;
    int i;

    for (i = 63; i >= 0; --i) {
        if (((in >> i) & 1) != 0)
            r = i;
    }
    return r;
}


int main(){
    ctz(0);
}
