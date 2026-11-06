#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // After r <<= 1 the low bit of r is 0, so adding the condition bit equals OR-ing it.
    // The new r is therefore (r << 1) | cond, where cond = ((x >> s) >= b).
    // b is computed from the doubled r before cond is applied, as in the reference.
    // The subtraction of b << s happens under the same condition, so the steps match.
    // The output is r << 12.
    uint64_t r = 0;
    uint64_t b;
    uint64_t c;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        r = r << 1;
        b = 3 * r * (r + 1) + 1;
        c = (x >> s) >= b;
        if (c)
            x -= b << s;
        r = r | c;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
