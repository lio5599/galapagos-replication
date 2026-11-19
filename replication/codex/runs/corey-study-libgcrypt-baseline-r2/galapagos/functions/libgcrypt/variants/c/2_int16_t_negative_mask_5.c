#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask(int16_t x)
{
    return -(int)((uint16_t)x >> 15);
}


int main(){
    int16_t_negative_mask(0);
}
