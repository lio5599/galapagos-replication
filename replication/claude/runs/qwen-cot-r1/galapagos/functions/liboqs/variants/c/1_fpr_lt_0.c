#include <stdint.h>

__attribute__((noinline))
int fpr_lt_1(uint64_t x, uint64_t y) {
    // Reference: compares two IEEE 754 double-precision bit patterns as signed values
    // Uses sign bits to determine comparison direction and handles same/different signs
    // For same signs: uses subtraction sign bit; for different signs: sign of x determines result
    // Edge case x==y handled by XOR of both subtraction results masking only when both negative
    int cc0, cc1;
    int64_t sx;
    int64_t sy;

    sx = *(int64_t *)&x;
    sy = *(int64_t *)&y;
    sy &= ~((sx ^ sy) >> 63);

    cc0 = (int)((sx - sy) >> 63) & 1;
    cc1 = (int)((sy - sx) >> 63) & 1;

    return cc0 ^ ((cc0 ^ cc1) & (int)((x & y) >> 63));
}


int main(){
    fpr_lt_1(0,0);
}
