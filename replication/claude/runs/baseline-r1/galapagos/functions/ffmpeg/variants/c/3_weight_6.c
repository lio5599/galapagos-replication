#include <stdint.h>

__attribute__((noinline))
static int weight(int i, int blen, int offset)
{
    int d, num, den;
    if (i < 2*offset)
        goto left;
    if (i > blen-1 - 2*offset)
        goto right;
    return 8;
left:
    d = i;
    goto compute;
right:
    d = blen-1 - i;
compute:
    if (offset == 1)
        return d ? 5 : 3;
    num = 6*d + offset - 1;
    den = 2*offset - 1;
    return 1 + num / den;
}


int main(){
    weight(0,0,0);
}
