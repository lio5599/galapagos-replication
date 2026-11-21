#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Resolve opposite signs first, then swap operands for negative pairs.
    // Swapping reverses unsigned order without changing equality behavior.
    // Opposite signed zeros follow the sign case rather than comparing equal.
    uint64_t temporary;

    if (((x ^ y) >> 63) != 0) {
        return (int)(x >> 63);
    }
    if ((x >> 63) != 0) {
        temporary = x;
        x = y;
        y = temporary;
    }
    return x < y;
}


int main(){
    fpr_lt(0,0);
}
