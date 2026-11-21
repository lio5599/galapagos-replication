#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Build the floor cube root greedily, from its highest possible bit down.
    // A bit is retained exactly when the candidate cubed does not exceed x.
    // Division avoids cube overflow, and every candidate is positive.
    // All roots fit in 22 bits, including the roots of zero and UINT64_MAX.
    uint64_t r = 0;
    uint64_t bit;

    for (bit = (uint64_t)1 << 21; bit != 0; bit >>= 1) {
        uint64_t candidate = r | bit;
        if (candidate <= x / candidate / candidate)
            r = candidate;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
