#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    int masks[2] = { 0x001F, 0x03E0 };
    int shifts[2] = { 0, 5 };
    int mults[2] = { 1, 32 };
    int result = 0;
    int i;
    for (i = 0; i < 2; i++) {
        int s = (2 * (c0 & masks[i]) + (c1 & masks[i])) >> shifts[i];
        result += s / 3 * mults[i];
    }
    result += (2 * (c0 >> 10) + (c1 >> 10)) / 3 * 1024;
    return result;
}


int main(){
    mix(0,0);
}
