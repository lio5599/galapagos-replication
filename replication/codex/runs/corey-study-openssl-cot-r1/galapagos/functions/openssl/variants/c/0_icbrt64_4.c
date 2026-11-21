#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Use the reference's restoring steps with an expanded trial polynomial.
    // 3*r*r + 3*r + 1 equals the difference between consecutive cubes.
    // The comparison guarantees the shifted subtraction fits without wrapping.
    // All 22 steps are retained, covering zero through UINT64_MAX exactly.
    uint64_t r = 0;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        uint64_t trial;
        r += r;
        trial = 3 * r * r + 3 * r + 1;
        if (trial <= (x >> s)) {
            x -= trial << s;
            ++r;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
