#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Counts the same 22 rounds using an unsigned iteration counter.
    // The shifts remain 63, 60, through 0, so every decision is unchanged.
    // Zero and the largest input follow exactly the reference recurrence.
    uint64_t r = 0;
    for (unsigned k = 22; k != 0; ) {
        --k;
        unsigned s = 3 * k;
        r += r;
        uint64_t b = 3 * r * (r + 1) + 1;
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
