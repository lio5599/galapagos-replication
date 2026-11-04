#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        uint64_t d = r * 2;
        uint64_t b = 3 * d * (d + 1) + 1;
        int taken = (x >> s) >= b;

        x = taken ? x - (b << s) : x;
        r = d + (uint64_t)taken;
    }
    return r * 4096;
}


int main(){
    icbrt64(0);
}
