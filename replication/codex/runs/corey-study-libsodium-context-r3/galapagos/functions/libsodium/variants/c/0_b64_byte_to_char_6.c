#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = ((x - 26U) / 256U) % 256U;
    unsigned int b = ((x - 52U) / 256U) % 256U;
    unsigned int c = ((x - 62U) / 256U) % 256U;
    unsigned int d = ((0U - (x ^ 62U)) / 256U) % 256U;
    unsigned int e = ((0U - (x ^ 63U)) / 256U) % 256U;

    return (a & (x + 'A')) |
           ((a ^ 255U) & b & (x + ('a' - 26))) |
           ((b ^ 255U) & c & (x + ('0' - 52))) |
           ((d ^ 255U) & '+') |
           ((e ^ 255U) & '/');
}


int main(){
    b64_byte_to_char(0);
}
