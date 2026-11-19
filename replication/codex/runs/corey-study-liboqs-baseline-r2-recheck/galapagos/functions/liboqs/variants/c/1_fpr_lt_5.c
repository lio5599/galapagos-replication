#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int sx = (int)(x >> 63);
    int different = (int)((x ^ y) >> 63);
    int same_sign_lt = (x < y) ^ (sx & (x != y));

    return same_sign_lt ^ ((same_sign_lt ^ sx) & different);
}


int main(){
    fpr_lt(0,0);
}
