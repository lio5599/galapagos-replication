#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    if ((x ^ y) >> 63) {
        return (int)(x >> 63);
    }
    return (x >> 63) ? (x > y) : (x < y);
}


int main(){
    fpr_lt(0,0);
}
