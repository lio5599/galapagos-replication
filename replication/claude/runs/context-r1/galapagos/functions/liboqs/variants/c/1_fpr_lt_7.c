#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t m = (uint64_t)0 - ((x & y) >> 63);
    uint64_t d = ((y - x) & m) | ((x - y) & ~m);

    return (int)(((x & ~y) | (~(x ^ y) & d)) >> 63);
}


int main(){
    fpr_lt(0,0);
}
