#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int upper = x + 'A';
    unsigned int lower = b & (x + ('a' - 26));
    unsigned int digits = ~b & c & (x + ('0' - 52));
    unsigned int symbols =
        (~((0U - (x ^ 62U)) >> 8) & '+') |
        (~((0U - (x ^ 63U)) >> 8) & '/');
    unsigned int letters = lower ^ ((upper ^ lower) & a);

    return (int)((letters | digits | symbols) & 255U);
}


int main(){
    b64_byte_to_char(0);
}
