#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = (uint64_t)1 << 22;

    if (x == 0)
        return 0;

    for (;;) {
        uint64_t next = (2 * r + x / r / r) / 3;

        if (next >= r)
            return r << 12;

        r = next;
    }
}


int main(){
    icbrt64(0);
}
