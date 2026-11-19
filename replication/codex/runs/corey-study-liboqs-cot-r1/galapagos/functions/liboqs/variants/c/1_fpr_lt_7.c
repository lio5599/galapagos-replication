#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Exclude equality before complementing the comparison for negatives.
    // For distinct equal-sign values, reversing less-than gives greater-than.
    // Different signs use the sign of x, including opposite signed zeros.
    if (x == y) {
        return 0;
    }
    if ((x ^ y) >> 63) {
        return (int)(x >> 63);
    }
    return (x < y) ^ (int)(x >> 63);
}


int main(){
    fpr_lt(0,0);
}
