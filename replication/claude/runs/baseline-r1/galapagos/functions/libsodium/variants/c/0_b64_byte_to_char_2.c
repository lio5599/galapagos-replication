#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = (unsigned char) ((x - 26U) >> 8);
    unsigned int b = (unsigned char) ((x - 52U) >> 8);
    unsigned int c = (unsigned char) ((x - 62U) >> 8);
    unsigned int d = (unsigned char) ~((0U - (x ^ 62U)) >> 8);
    unsigned int e = (unsigned char) ~((0U - (x ^ 63U)) >> 8);

    return (int) ((e & '/') | (d & '+') |
                  ((unsigned char) ~b & c & (x + ('0' - 52))) |
                  ((unsigned char) ~a & b & (x + ('a' - 26))) |
                  (a & (x + 'A')));
}


int main(){
    b64_byte_to_char(0);
}
