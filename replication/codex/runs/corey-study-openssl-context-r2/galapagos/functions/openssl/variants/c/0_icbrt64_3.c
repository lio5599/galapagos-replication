#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;

    for (unsigned int i = 0; i < 22; ++i) {
        unsigned int s = 63 - 3 * i;
        r <<= 1;
        uint64_t b = 3 * r * (r + 1) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            ++r;
        }
    }

    return r << 12;
}


int main(){
    icbrt64(0);
}
