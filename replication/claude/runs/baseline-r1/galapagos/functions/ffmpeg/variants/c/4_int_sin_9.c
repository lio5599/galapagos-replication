#include <stdint.h>

__attribute__((noinline))
static int64_t int_sin(int64_t a)
{
    int64_t m, a2, res = 0;
    int i;
    if (a < 0) a = 3294199 - a;
    m = a - (a / 6588398) * 6588398;
    if (m >= 4941298) m -= 6588398;
    else if (m >= 1647099) m = 3294199 - m;
    a2 = (m * m) / (1 << 20);
    for (i = 2; i < 11; i += 2) {
        res += m;
        m = (0 - m) * a2 / ((1 << 20) * i * (i + 1));
    }
    return (res + 8) >> 4;
}


int main(){
    int_sin(0);
}
