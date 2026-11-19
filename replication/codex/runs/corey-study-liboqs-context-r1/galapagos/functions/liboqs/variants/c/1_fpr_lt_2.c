#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y) {
    if (x >> 63) {
        return (y >> 63) ? x > y : 1;
    }
    return (y >> 63) ? 0 : x < y;
}


int main(){
    fpr_lt(0,0);
}
