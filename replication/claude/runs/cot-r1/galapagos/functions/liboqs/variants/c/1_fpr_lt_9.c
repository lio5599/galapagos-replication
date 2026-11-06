#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Bitwise boolean formula over sign bits sx, sy and unsigned lt = x<y, gt = x>y.
    // Signs differ (d = 1): the result is sx, the reference's sgn(sx) case.
    // Signs equal: the result is gt if sx is set (negative, reversed), else lt.
    // Equal inputs have equal signs and lt = gt = 0, so the result is 0.
    unsigned sx = (unsigned)(x >> 63), sy = (unsigned)(y >> 63);
    unsigned lt = x < y, gt = x > y, d = sx ^ sy;
    return (int)((d & sx) | ((d ^ 1u) & ((sx & gt) | ((sx ^ 1u) & lt))));
}


int main(){
    fpr_lt(0,0);
}
