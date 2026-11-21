#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Computes the trial threshold before doubling the partial root.
    // Substituting twice r gives 12*r*r + 6*r + 1.
    // These values fit, preserving every trial even at the input extremes.
    uint64_t r = 0;
    for (int s = 63; s >= 0; s -= 3) {
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
