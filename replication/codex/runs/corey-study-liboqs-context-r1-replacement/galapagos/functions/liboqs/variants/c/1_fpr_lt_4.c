#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    uint64_t sign_bit = (uint64_t)1 << 63;
    uint64_t mx = ((uint64_t)0 - (x >> 63)) | sign_bit;
    uint64_t my = ((uint64_t)0 - (y >> 63)) | sign_bit;

    return (x ^ mx) < (y ^ my);
}


int main(){
    fpr_lt(0,0);
}
