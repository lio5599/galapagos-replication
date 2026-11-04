#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    uint64_t b, rem = x;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        uint64_t r2 = r << 1;
        uint64_t top = rem >> s;
        b = 3 * r2 * (r2 + 1) + 1;
        if (top >= b) {
            rem -= b << s;
            r = r2 + 1;
        } else {
            r = r2;
        }
    }
    return r << (36 / 3);
}


int main(){
    icbrt64(0);
}
