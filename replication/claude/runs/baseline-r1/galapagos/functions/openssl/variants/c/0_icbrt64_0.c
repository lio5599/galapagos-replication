#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    uint64_t b;
    int s = 63;

    while (s >= 0) {
        r <<= 1;
        b = 3 * r * (r + 1) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r++;
        }
        s -= 3;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
