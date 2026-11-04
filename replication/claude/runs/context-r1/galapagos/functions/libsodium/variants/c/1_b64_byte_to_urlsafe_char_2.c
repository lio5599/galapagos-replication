#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned char a = (unsigned char) ((x - 26U) >> 8);
    unsigned char b = (unsigned char) ((x - 52U) >> 8);
    unsigned char c = (unsigned char) ((x - 62U) >> 8);
    unsigned char na = (unsigned char) ~a;
    unsigned char nb = (unsigned char) ~b;
    unsigned char d = (unsigned char) ~(unsigned char) ((0U - (x ^ 62U)) >> 8);
    unsigned char e = (unsigned char) ~(unsigned char) ((0U - (x ^ 63U)) >> 8);
    unsigned int r;

    r = (unsigned int) a & (x + 65U);
    r |= (unsigned int) na & (unsigned int) b & (x + 71U);
    r |= (unsigned int) nb & (unsigned int) c & (x - 4U);
    r |= (unsigned int) d & 45U;
    r |= (unsigned int) e & 95U;
    return (int) r;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
