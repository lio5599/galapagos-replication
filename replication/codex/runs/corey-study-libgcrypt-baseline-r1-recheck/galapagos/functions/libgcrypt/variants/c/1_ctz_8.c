#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    int r = 64;

    if (in != 0) {
        r = 0;
        while (in % (uint64_t)2 == 0) {
            in /= (uint64_t)2;
            ++r;
        }
    }

    return r;
}


int main(){
    ctz(0);
}
