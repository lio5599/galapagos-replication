#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int signx = (int)(x >> 63);
    int signy = (int)(y >> 63);

    if (signx != signy) {
        return signx;
    }
    if (signx != 0) {
        return y < x;
    }
    return x < y;
}


int main(){
    fpr_lt(0,0);
}
