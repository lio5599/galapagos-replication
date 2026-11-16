#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    int r = 0;
    int seen_one = 0;
    int i;
    for (i = 0; i < 64; i++)
    {
        int bit = (int)((in >> i) & 1);
        if (bit)
            seen_one = 1;
        if (!seen_one)
            r++;
    }
    return r;
}


int main(){
    ctz(0);
}
