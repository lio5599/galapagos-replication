#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    uint64_t sign = (uint64_t)1 << 63;
    uint64_t kx = x ^ (((uint64_t)0 - (x >> 63)) | sign);
    uint64_t ky = y ^ (((uint64_t)0 - (y >> 63)) | sign);

    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
