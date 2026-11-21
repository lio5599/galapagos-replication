#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    for (int s = 63; s >= 0; s -= 3) {
        uint64_t candidate = (r << 1) + 1;
        uint64_t b = 3 * candidate * (candidate - 1) + 1;
        r = candidate - 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r = candidate;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
