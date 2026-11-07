#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x + ~25U) >> 8) & 0xFFU;
    unsigned int b = ((x + ~51U) >> 8) & 0xFFU;
    unsigned int c = ((x + ~61U) >> 8) & 0xFFU;
    unsigned int d = ~((~(x ^ 62U) + 1U) >> 8) & 0xFFU;
    unsigned int e = ~((~(x ^ 63U) + 1U) >> 8) & 0xFFU;

    return (a & (x + 'A')) |
           ((0xFFU ^ a) & b & (x + ('a' - 26))) |
           ((0xFFU ^ b) & c & (x + ('0' - 52))) |
           (d & '-') | (e & '_');
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
