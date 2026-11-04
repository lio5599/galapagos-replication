#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    uint64_t b;
    int i, s;

    for (i = 0; i < 22; i++) {
        s = 63 - 3 * i;
        r = r * 2;
        b = 3 * r * r + 3 * r + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r += 1;
        }
    }
    return r * 4096;
}


int main(){
    icbrt64(0);
}
