#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = ((x - 26U) / 256U) & 255U;
    unsigned int b = ((x - 52U) / 256U) & 255U;
    unsigned int c = ((x - 62U) / 256U) & 255U;
    unsigned int d = ((0U - (x ^ 62U)) / 256U) & 255U;
    unsigned int e = ((0U - (x ^ 63U)) / 256U) & 255U;

    return (a & (x + 'A')) |
           ((255U ^ a) & b & (x + ('a' - 26))) |
           ((255U ^ b) & c & (x + ('0' - 52))) |
           ((255U ^ d) & '+') |
           ((255U ^ e) & '/');
}


int main(){
    b64_byte_to_char(0);
}
