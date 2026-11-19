#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    int i;
    for (i = 0; i < 64; ++i) {
        if (((in >> i) & 1) != 0)
            return i;
    }
    return 64;
}


int main(){
    ctz(0);
}
