#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Use two trial points to reduce a bracket containing the floor cube root.
    // lo remains feasible and hi remains an exclusive upper bound.
    // Trial points never exceed 2642245, so their cubes cannot overflow.
    // Each iteration shrinks the bracket, including for zero and UINT64_MAX.
    uint64_t lo = 0;
    uint64_t hi = 2642246;

    while (hi - lo > 1) {
        uint64_t width = hi - lo;
        uint64_t a = lo + width / 3;
        uint64_t b = lo + (2 * width) / 3;

        if (b * b * b <= x) {
            lo = b;
        } else if (a * a * a <= x) {
            lo = a;
            hi = b;
        } else {
            hi = a;
        }
    }
    return lo << 12;
}


int main(){
    icbrt64(0);
}
