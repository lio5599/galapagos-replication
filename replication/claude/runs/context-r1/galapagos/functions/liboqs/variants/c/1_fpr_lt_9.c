#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int lt = (int64_t)x < (int64_t)y;
    int both = (int)((x & y) >> 63);
    int ne = x != y;

    return ne & (lt ^ both);
}


int main(){
    fpr_lt(0,0);
}
