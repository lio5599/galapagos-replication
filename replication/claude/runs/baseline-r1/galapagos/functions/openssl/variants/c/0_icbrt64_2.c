#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;
    uint64_t b;
    int s = 66;

    do {
        s -= 3;
        r <<= 1;
        b = (3 * r * (r + 1)) | 1;
        if (!((x >> s) < b)) {
            x -= b << s;
            r |= 1;
        }
    } while (s > 0);
    return r << 12;
}


int main(){
    icbrt64(0);
}
