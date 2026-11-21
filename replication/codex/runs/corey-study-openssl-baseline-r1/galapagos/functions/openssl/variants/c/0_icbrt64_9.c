#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    uint64_t square = 0;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        uint64_t trial;

        r *= 2;
        square *= 4;
        trial = 3 * square + 3 * r + 1;

        if ((x >> s) >= trial) {
            x -= trial << s;
            square += 2 * r + 1;
            ++r;
        }
    }

    return r << 12;
}


int main(){
    icbrt64(0);
}
