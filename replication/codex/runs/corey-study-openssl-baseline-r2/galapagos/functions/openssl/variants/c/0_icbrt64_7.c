#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    if (x == 0)
        return 0;

    unsigned bits = 0;
    for (uint64_t v = x; v; v >>= 1)
        ++bits;

    uint64_t r = (uint64_t)1 << ((bits + 2) / 3);
    uint64_t next = (2 * r + x / (r * r)) / 3;

    while (next < r) {
        r = next;
        next = (2 * r + x / (r * r)) / 3;
    }

    return r << 12;
}


int main(){
    icbrt64(0);
}
