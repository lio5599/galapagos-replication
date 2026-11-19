#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    unsigned sx = (unsigned)(x >> 63);
    unsigned different = (unsigned)((x ^ y) >> 63);
    unsigned less = (unsigned)(x < y);
    unsigned unequal = (unsigned)(x != y);
    unsigned same_sign_result = less ^ (sx & unequal);

    return (int)((different & sx)
        | ((different ^ 1U) & same_sign_result));
}


int main(){
    fpr_lt(0,0);
}
