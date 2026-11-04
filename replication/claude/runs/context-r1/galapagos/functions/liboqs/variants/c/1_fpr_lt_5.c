#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t mask = (uint64_t)0 - ((x & y) >> 63);
    uint64_t t = (x ^ y) & mask;
    uint64_t a = x ^ t;
    uint64_t b = y ^ t;

    return (int64_t)a < (int64_t)b;
}


int main(){
    fpr_lt(0,0);
}
