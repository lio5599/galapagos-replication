#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
    int32_t product = (int32_t)20159 * a;
    int32_t rounded = product + 33554432;
    int16_t t = (int16_t)(rounded >> 26);
    t = (int16_t)((int32_t)t * 3329);
    return a - t;
}


int main(){
    barrett_reduce(0);
}
