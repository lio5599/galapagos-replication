#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    uint64_t remainder = 0;

    for (int s = 63; s >= 0; s -= 3) {
        remainder = (remainder << 3) | ((x >> s) & 7);
        uint64_t trial = 12 * r * r + 6 * r + 1;
        r <<= 1;
        if (remainder >= trial) {
            remainder -= trial;
            ++r;
        }
    }

    return r << 12;
}


int main(){
    icbrt64(0);
}
