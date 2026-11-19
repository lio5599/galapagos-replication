#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
    int32_t product = (int32_t)a * 20159;
    int16_t t = (int16_t)((product + 33554432) >> 26);
    t = (int16_t)((int32_t)t * 3328 + t);
    return a - t;
}


int main(){
    barrett_reduce(0);
}
