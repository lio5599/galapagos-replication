#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int both = (int)((x & y) >> 63);
    int a = (int64_t)x < (int64_t)y;
    int b = (int64_t)y < (int64_t)x;

    return a ^ ((a ^ b) & both);
}


int main(){
    fpr_lt(0,0);
}
