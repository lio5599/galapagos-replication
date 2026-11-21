#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    unsigned int s = 63;
    for (;;) {
        r <<= 1;
        uint64_t b = 3 * r * (r + 1) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            ++r;
        }
        if (s == 0)
            break;
        s -= 3;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
