#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Replace multiplication by three with three unsigned additions.
    // Unsigned distributivity preserves the trial value exactly.
    // The reference decisions, including endpoint cases, remain unchanged.
    uint64_t r = 0;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        uint64_t t;
        uint64_t b;
        r += r;
        t = r * (r + 1);
        b = t + t + t + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r += 1;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
