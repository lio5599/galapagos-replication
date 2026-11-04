#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t lo = 0;
    uint64_t hi = (uint64_t)1 << 22;
    uint64_t mid;

    while (hi - lo > 1) {
        mid = (lo + hi) >> 1;
        if (mid <= x / (mid * mid))
            lo = mid;
        else
            hi = mid;
    }
    return lo << 12;
}


int main(){
    icbrt64(0);
}
