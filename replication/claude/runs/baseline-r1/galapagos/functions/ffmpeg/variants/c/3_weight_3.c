#include <stdint.h>

__attribute__((noinline))
static int weight(int i, int blen, int offset)
{
    static const int small[2] = {3, 5};
    int d;
    if (i < 2*offset) {
        d = i;
    } else if (i > blen-1 - 2*offset) {
        d = blen-1 - i;
    } else {
        return 8;
    }
    if (offset == 1)
        return small[d != 0];
    return 1 + (6*d + offset - 1) / (2*offset - 1);
}


int main(){
    weight(0,0,0);
}
