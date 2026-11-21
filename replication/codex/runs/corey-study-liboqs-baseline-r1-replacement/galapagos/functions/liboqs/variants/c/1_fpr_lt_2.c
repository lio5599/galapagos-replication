#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    const uint64_t sign = (uint64_t)1 << 63;
    uint64_t kx = (x & sign) ? ~x : (x ^ sign);
    uint64_t ky = (y & sign) ? ~y : (y ^ sign);

    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
