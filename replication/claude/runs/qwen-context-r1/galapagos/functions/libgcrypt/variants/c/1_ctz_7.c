#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    int r = 0;
    int i;
    for (i = 0; i < 64; i++)
    {
        if ((in & ((uint64_t)1 << i)) == 0)
            r++;
        else
            break;
    }
    return r;
}


int main(){
    ctz(0);
}
