#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask(int16_t x)
{
    return -((uint16_t)x > 32767u);
}


int main(){
    int16_t_negative_mask(0);
}
