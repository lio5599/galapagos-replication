#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
    int32_t x = (int32_t)a * 20159 + 33554432;
    x >>= 13;
    x >>= 13;
    int16_t t = (int16_t)x;
    t *= 3329;
    return a - t;
}


int main(){
    barrett_reduce(0);
}
