#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    int s = 63;

    do {
        uint64_t trial;
        uint64_t mask;

        r += r;
        trial = 3 * r * (r + 1) + 1;
        mask = (uint64_t)0 - (uint64_t)((x >> s) >= trial);
        x -= (trial << s) & mask;
        r += mask & 1;

        s -= 3;
    } while (s >= 0);

    return r << 12;
}


int main(){
    icbrt64(0);
}
