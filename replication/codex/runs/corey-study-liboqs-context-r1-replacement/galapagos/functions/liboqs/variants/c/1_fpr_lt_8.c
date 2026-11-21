#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    uint64_t sx = x >> 63;
    uint64_t different = (x ^ y) >> 63;
    uint64_t forward = (x - y) >> 63;
    uint64_t reverse = (y - x) >> 63;
    uint64_t same_sign_result = forward ^ ((forward ^ reverse) & sx);

    return (int)((different & sx)
        | ((different ^ (uint64_t)1) & same_sign_result));
}


int main(){
    fpr_lt(0,0);
}
