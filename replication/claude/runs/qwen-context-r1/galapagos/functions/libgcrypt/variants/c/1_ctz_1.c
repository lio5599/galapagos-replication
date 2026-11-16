#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    int r = 0;
    int found = 0;
    int i;
    for (i = 0; i < 64; i++)
    {
        int b = (int)((in >> i) & 1);
        if (b)
            found = 1;
        if (!found && !b)
            r++;
    }
    return r;
}


int main(){
    ctz(0);
}
