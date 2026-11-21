#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Forms three times r times r plus one using additions.
    // The product and its triple fit in uint64_t throughout all 22 rounds.
    // Thus the trial thresholds and edge-case behavior are unchanged.
    uint64_t r = 0;
    for (int s = 63; s >= 0; s -= 3) {
        r += r;
        uint64_t p = r * (r + 1);
        uint64_t b = p + p + p + 1;
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
