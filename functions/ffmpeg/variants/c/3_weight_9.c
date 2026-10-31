#include <stdint.h>

__attribute__((noinline))
static int weight(int i, int blen, int offset)
{
    int d;
    if (i >= 2*offset && i <= blen-1 - 2*offset)
        return 8;
    if (i < 2*offset)
        d = i;
    else
        d = blen-1 - i;
    if (offset == 1) {
        int w = 3;
        if (d != 0)
            w += 2;
        return w;
    }
    {
        int q = 6*d + offset - 1;
        q /= 2*offset - 1;
        return q + 1;
    }
}


int main(){
    weight(0,0,0);
}
