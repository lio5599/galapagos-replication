#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    uint64_t different = (x ^ y) >> 63;
    uint64_t adjusted_y = y & (different - (uint64_t)1);
    unsigned cc0 = (unsigned)((x - adjusted_y) >> 63);
    unsigned cc1 = (unsigned)((adjusted_y - x) >> 63);
    unsigned both_negative = (unsigned)((x & y) >> 63);

    return (int)(cc0 ^ ((cc0 ^ cc1) & both_negative));
}


int main(){
    fpr_lt(0,0);
}
