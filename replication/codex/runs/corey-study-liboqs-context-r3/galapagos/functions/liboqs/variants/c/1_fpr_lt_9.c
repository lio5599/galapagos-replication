#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    uint64_t reverse_mask = (uint64_t)0 - ((x & y) >> 63);
    uint64_t swap_bits = (x ^ y) & reverse_mask;
    uint64_t a = x ^ swap_bits;
    uint64_t b = y ^ swap_bits;

    return (int)(a < b) ^ (int)((x ^ y) >> 63);
}


int main(){
    fpr_lt(0,0);
}
