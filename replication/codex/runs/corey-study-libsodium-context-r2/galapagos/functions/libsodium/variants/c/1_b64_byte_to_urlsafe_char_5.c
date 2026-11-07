#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int y = x - 26U;
    unsigned int z = y - 26U;
    unsigned int a = (y >> 8) & 0xFFU;
    unsigned int b = (z >> 8) & 0xFFU;
    unsigned int c = ((z - 10U) >> 8) & 0xFFU;
    unsigned int d = (((x ^ 62U) - 1U) >> 8) & 0xFFU;
    unsigned int e = (((x ^ 63U) - 1U) >> 8) & 0xFFU;

    return (a & (x + 'A')) |
           (~a & b & (x + ('a' - 26))) |
           (~b & c & (x + ('0' - 52))) |
           (d & '-') | (e & '_');
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
