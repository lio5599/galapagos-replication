#include <stdint.h>

__attribute__((noinline))
static int64_t int_sin(int64_t a)
{
    int64_t a2, res = 0;
    int i;
    a = (a < 0 ? 3294199 - a : a) % (2 * 3294199);
    a = (a >= 3294199 * 3 / 2) ? a - 2 * 3294199 : a;
    a = (a >= 3294199 / 2) ? 3294199 - a : a;
    a2 = (a * a) / (1 << 20);
    for (i = 2; i <= 10; i += 2) {
        res += a;
        a = -((a * a2) / ((int64_t)(1 << 20) * i * (i + 1)));
    }
    return (res + 8) >> 4;
}


int main(){
    int_sin(0);
}
