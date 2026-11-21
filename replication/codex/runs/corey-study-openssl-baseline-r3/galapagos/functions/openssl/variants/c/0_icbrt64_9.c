#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    uint64_t r = 0;

    for (uint64_t place = 1000000; place; place /= 10) {
        for (unsigned digit = 9; digit != 0; --digit) {
            uint64_t candidate = r + digit * place;

            if (candidate <= x / candidate / candidate) {
                r = candidate;
                break;
            }
        }
    }

    return r << 12;
}


int main(){
    icbrt64(0);
}
