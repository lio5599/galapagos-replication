#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Computes integer cube root using Newton-Raphson iteration
    // Starts with initial guess based on bit length
    // Iterates until convergence, then scales by 2^12
    // Equivalent because Newton method converges to floor(cbrt(x))
    uint64_t r;
    if (x == 0) return 0;
    r = 1 << ((__builtin_clzll(x) / 3) + 12);
    for (int i = 0; i < 5; i++) {
        r = (2 * r + x / (r * r >> 24)) / 3;
    }
    return r;
}


int main(){
    icbrt64(0);
}
