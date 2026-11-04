#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x - 26U) & 0xFF00U) >> 8;
    unsigned int b = ((x - 52U) & 0xFF00U) >> 8;
    unsigned int c = ((x - 62U) & 0xFF00U) >> 8;
    unsigned int d = ((((0U - (x ^ 62U)) & 0xFF00U) ^ 0xFF00U) >> 8);
    unsigned int e = ((((0U - (x ^ 63U)) & 0xFF00U) ^ 0xFF00U) >> 8);
    unsigned int low = (a & ((x + 65U) & 0xFFU)) | ((a ^ 0xFFU) & b & ((x + 71U) & 0xFFU));
    unsigned int high = ((b ^ 0xFFU) & c & ((x - 4U) & 0xFFU)) | (d & 45U) | (e & 95U);

    return (int) (high | low);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
