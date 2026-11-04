#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    if ((int64_t)x < 0) {
        if ((int64_t)y < 0) {
            return y < x;
        }
        return 1;
    }
    if ((int64_t)y < 0) {
        return 0;
    }
    return x < y;
}


int main(){
    fpr_lt(0,0);
}
