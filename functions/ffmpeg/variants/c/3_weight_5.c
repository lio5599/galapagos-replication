#include <stdint.h>

__attribute__((noinline))
static int weight(int i, int blen, int offset)
{
    int d = 0;
    int edge = 0;
    do {
        if (i < 2*offset) {
            d = i;
            edge = 1;
            break;
        }
        if (i > blen-1 - 2*offset) {
            d = blen-1 - i;
            edge = 1;
            break;
        }
    } while (0);
    if (!edge)
        return 8;
    if (offset == 1) {
        if (d)
            return 5;
        return 3;
    }
    return 1 + (6*d + offset - 1) / (2*offset - 1);
}


int main(){
    weight(0,0,0);
}
