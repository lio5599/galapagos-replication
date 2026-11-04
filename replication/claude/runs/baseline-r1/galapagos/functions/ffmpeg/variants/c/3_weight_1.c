#include <stdint.h>

__attribute__((noinline))
static int weight(int i, int blen, int offset)
{
    int two = 2*offset;
    int last = blen - 1;
    int d;
    if (!(i < two) && !(i > last - two))
        return 8;
    d = (i < two) ? i : (last - i);
    return offset == 1 ? (d != 0 ? 5 : 3) : (1 + (6*d + offset - 1) / (two - 1));
}


int main(){
    weight(0,0,0);
}
