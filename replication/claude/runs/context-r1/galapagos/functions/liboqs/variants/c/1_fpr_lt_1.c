#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    return ((int64_t)(x & y) < 0) ? ((int64_t)y < (int64_t)x) : ((int64_t)x < (int64_t)y);
}


int main(){
    fpr_lt(0,0);
}
