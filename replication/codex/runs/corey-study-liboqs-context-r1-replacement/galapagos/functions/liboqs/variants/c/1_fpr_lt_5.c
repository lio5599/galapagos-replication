#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    uint64_t sign_bit = (uint64_t)1 << 63;
    uint64_t kx = (x & sign_bit) ? ~x : (x | sign_bit);
    uint64_t ky = (y & sign_bit) ? ~y : (y | sign_bit);

    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
