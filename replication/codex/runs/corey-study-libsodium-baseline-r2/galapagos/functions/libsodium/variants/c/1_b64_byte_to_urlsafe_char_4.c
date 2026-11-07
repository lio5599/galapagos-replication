#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int upper = x + 'A';
    unsigned int lower = b & (x + ('a' - 26));
    unsigned int digits = ~b & c & (x + ('0' - 52));
    unsigned int punctuation =
        (~((0U - (x ^ 62U)) >> 8) & '-') |
        (~((0U - (x ^ 63U)) >> 8) & '_');

    return (int)(((lower ^ ((upper ^ lower) & a)) |
                  digits | punctuation) & 0xFFU);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
