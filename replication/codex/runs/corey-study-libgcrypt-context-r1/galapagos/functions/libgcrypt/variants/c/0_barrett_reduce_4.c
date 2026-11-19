#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
    int32_t product = (int32_t)a * 20159;
    int32_t rounded = (product >> 25) + 1;
    int16_t t = (int16_t)(rounded >> 1);
    t *= 3329;
    return a - t;
}


int main(){
    barrett_reduce(0);
}
