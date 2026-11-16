#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Hybrid approach: bit scan for initial guess
    // Uses most significant bit to estimate magnitude
    // Refines with single Newton step for accuracy
    // Scales result by 2^12 as required by specification
    if (x == 0) return 0;
    int leading_zeros = __builtin_clzll(x);
    uint64_t r = 1ULL << ((63 - leading_zeros) / 3 + 12);
    r = (2 * r + x / (r * r >> 24)) / 3;
    while ((r + 1) * (r + 1) * (r + 1) <= x << 24) r++;
    while (r * r * r > x << 24) r--;
    return r;
}


int main(){
    icbrt64(0);
}
