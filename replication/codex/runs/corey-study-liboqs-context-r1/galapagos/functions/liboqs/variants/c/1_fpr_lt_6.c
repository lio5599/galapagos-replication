#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y) {
    int sx = (int)(x >> 63);
    int different = (int)((x ^ y) >> 63);
    int same_sign_result = (x != y) & ((x < y) ^ sx);

    return (different & sx) | ((different ^ 1) & same_sign_result);
}


int main(){
    fpr_lt(0,0);
}
