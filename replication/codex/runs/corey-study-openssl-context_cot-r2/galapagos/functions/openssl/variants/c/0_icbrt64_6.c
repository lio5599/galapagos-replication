#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Convert each trial decision into an unsigned all-zero or all-one mask.
    // The mask selects exactly the reference subtraction and increment.
    // All shifts are within 0 through 63, even when the trial fails.
    uint64_t r = 0;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        uint64_t b;
        uint64_t take;
        uint64_t mask;
        r <<= 1;
        b = 3 * r * (r + 1) + 1;
        take = (x >> s) >= b;
        mask = (uint64_t)0 - take;
        x -= (b << s) & mask;
        r += take;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
