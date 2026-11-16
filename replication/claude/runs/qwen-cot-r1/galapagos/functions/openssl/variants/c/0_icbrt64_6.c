#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Iterative improvement from upper bound estimate
    // Starts with overestimate based on bit length
    // Reduces estimate until cube is just below target
    // Final adjustment ensures correct floor value
    if (x == 0) return 0;
    uint64_t r = 1 << ((__builtin_clzll(x) / 3) + 13);
    while (r * r * r > x << 24) r--;
    while ((r + 1) * (r + 1) * (r + 1) <= x << 24) r++;
    return r;
}


int main(){
    icbrt64(0);
}
