#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Expresses the reference loop as a while loop.
    // The shift sequence, trial values, and accepted digits are unchanged.
    // No shift occurs after s becomes negative, so all inputs remain defined.
    uint64_t r = 0;
    int s = 63;

    while (s >= 0) {
        uint64_t b;
        r <<= 1;
        b = 3 * r * (r + 1) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r += 1;
        }
        s -= 3;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
