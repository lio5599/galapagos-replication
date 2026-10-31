#include <stdint.h>

__attribute__((noinline))
static int weight(int i, int blen, int offset)
{
    int inLeft = (i < 2*offset);
    int inRight = (i > blen-1 - 2*offset);
    int d;
    if (inLeft || inRight) {
        d = inLeft ? i : (blen-1 - i);
        if (offset == 1)
            return d ? 5 : 3;
        return (6*d + offset - 1) / (2*offset - 1) + 1;
    }
    return 8;
}


int main(){
    weight(0,0,0);
}
