#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);

    return (sx && !sy)
        || (!sx && !sy && x < y)
        || (sx && sy && x > y);
}


int main(){
    fpr_lt(0,0);
}
