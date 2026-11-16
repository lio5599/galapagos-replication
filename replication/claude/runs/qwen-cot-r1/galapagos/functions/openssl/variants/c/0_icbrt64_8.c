#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Recursive divide-and-conquer cube root
    // Splits problem into high and low parts
    // Combines results with correction term
    // Base cases handle small values directly
    if (x < 8) return x < 1 ? 0 : 1092;
    uint64_t high = x >> 6;
    uint64_t r = icbrt64(high) >> 2;
    while ((r + 1) * (r + 1) * (r + 1) <= x << 24) r++;
    while (r * r * r > x << 24) r--;
    return r;
}


int main(){
    icbrt64(0);
}
