#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Compute the trial polynomial before doubling the partial root.
    // Substituting twice r gives 12*r*r + 6*r + 1.
    // Unsigned arithmetic preserves this identity for all input cases.
    uint64_t r = 0;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        uint64_t b = 12 * r * r + 6 * r + 1;
        r <<= 1;
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
