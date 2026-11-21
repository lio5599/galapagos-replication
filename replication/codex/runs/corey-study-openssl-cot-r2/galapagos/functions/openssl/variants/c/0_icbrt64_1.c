#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Search the inclusive range of possible uint64_t cube roots.
    // Every candidate is at most 2642245, so its cube cannot overflow.
    // Save the largest candidate whose cube does not exceed x.
    // Zero and the maximum input are covered; scaling matches the reference.
    uint64_t lo = 0;
    uint64_t hi = 2642245;
    uint64_t r = 0;

    while (lo <= hi) {
        uint64_t m = lo + (hi - lo) / 2;
        uint64_t cube = m * m * m;
        if (cube <= x) {
            r = m;
            lo = m + 1;
        } else {
            hi = m - 1;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
