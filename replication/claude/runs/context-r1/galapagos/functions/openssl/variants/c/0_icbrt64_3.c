#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    uint64_t r2 = 0;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        uint64_t b;

        r <<= 1;
        r2 <<= 2;
        b = 3 * r2 + 3 * r + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r2 += 2 * r + 1;
            r += 1;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
