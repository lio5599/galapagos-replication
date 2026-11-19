#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
    int16_t t = (int16_t)(((int32_t)a * 20159 + 33554432) >> 26);
    t *= 3329;
    return a - t;
}


int main(){
    barrett_reduce(0);
}
