#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    uint64_t sign_bit = (uint64_t)1 << 63;

    if (x < sign_bit)
        return (y < sign_bit) && (x < y);
    return (y < sign_bit) || (x > y);
}


int main(){
    fpr_lt(0,0);
}
