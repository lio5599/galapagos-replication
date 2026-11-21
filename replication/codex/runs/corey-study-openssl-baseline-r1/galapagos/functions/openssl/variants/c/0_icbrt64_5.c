#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t t = x;
    uint64_t r;
    unsigned bits = 0;

    if (x == 0)
        return 0;

    while (t != 0) {
        ++bits;
        t >>= 1;
    }

    r = (uint64_t)1 << ((bits + 2) / 3);

    for (;;) {
        uint64_t quotient = x / r / r;
        uint64_t next = (r + r + quotient) / 3;

        if (next >= r)
            break;

        r = next;
    }

    return r << 12;
}


int main(){
    icbrt64(0);
}
