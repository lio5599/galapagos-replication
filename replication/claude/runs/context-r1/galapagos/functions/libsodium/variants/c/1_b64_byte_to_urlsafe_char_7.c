#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = 0xFFU - (((0U - (x ^ 62U)) >> 8) & 0xFFU);
    unsigned int e = 0xFFU - (((0U - (x ^ 63U)) >> 8) & 0xFFU);
    unsigned int t2 = (0xFFU - a) & b & (x + 71U);
    unsigned int t3 = (0xFFU - b) & c & (x - 4U);
    unsigned int t4 = d & 45U;
    unsigned int t5 = e & 95U;
    unsigned int r = a & (x + 65U);

    r = r + t2 - (r & t2);
    r = r + t3 - (r & t3);
    r = r + t4 - (r & t4);
    r = r + t5 - (r & t5);
    return (int) r;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
