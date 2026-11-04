#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t m = (uint64_t)1 << 63;

    if ((x & y & m) != 0) {
        return y < x;
    }
    return (x ^ m) < (y ^ m);
}


int main(){
    fpr_lt(0,0);
}
