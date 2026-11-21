#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Narrow the root interval using two cube probes per iteration.
    // Monotonic cubes preserve an interval containing the exact floor root.
    // Candidates never exceed 2642245, so both cube products fit uint64_t.
    // The interval strictly shrinks, including for zero and the maximum input.
    uint64_t lo = 0;
    uint64_t hi = 2642245;

    while (lo < hi) {
        uint64_t third = (hi - lo) / 3;
        uint64_t a = lo + third;
        uint64_t b = hi - third;

        if (a * a * a > x) {
            hi = a - 1;
        } else if (b * b * b <= x) {
            lo = b;
        } else {
            lo = a;
            hi = b - 1;
        }
    }
    return lo << 12;
}


int main(){
    icbrt64(0);
}
