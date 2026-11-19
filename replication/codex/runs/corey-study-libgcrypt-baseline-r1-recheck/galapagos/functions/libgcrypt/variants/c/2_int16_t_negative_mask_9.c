#include <stdint.h>

__attribute__((noinline))
static int int16_t_negative_mask(int16_t x)
{
    return (int)(((long)x + 32768L) / 32768L) - 1;
}


int main(){
    int16_t_negative_mask(0);
}
