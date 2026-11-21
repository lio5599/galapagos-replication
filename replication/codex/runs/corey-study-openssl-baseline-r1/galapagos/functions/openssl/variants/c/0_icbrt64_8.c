#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    uint64_t remainder = 0;
    unsigned group = 22;

    while (group != 0) {
        uint64_t trial;
        uint64_t take;

        --group;
        remainder = remainder * 8 + ((x >> (group * 3)) & 7);
        trial = 12 * r * r + 6 * r + 1;
        take = (uint64_t)(remainder >= trial);
        remainder -= trial * take;
        r = 2 * r + take;
    }

    return r << 12;
}


int main(){
    icbrt64(0);
}
