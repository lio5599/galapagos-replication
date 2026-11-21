#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Consume octal digits while retaining the remainder after subtracting r cubed.
    // Appending a digit doubles the root; the trial adds its next possible bit.
    // The consecutive-cube difference makes each accepted bit exact.
    // Remainders and trials fit in uint64_t, including zero and maximum input.
    uint64_t r = 0;
    uint64_t remainder = 0;
    int shift;

    for (shift = 63; shift >= 0; shift -= 3) {
        uint64_t trial;
        remainder = (remainder << 3) | ((x >> shift) & 7);
        r <<= 1;
        trial = 3 * r * (r + 1) + 1;
        if (remainder >= trial) {
            remainder -= trial;
            ++r;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
