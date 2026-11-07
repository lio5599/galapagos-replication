#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x + ~25U) >> 8) & 255U;
    unsigned int b = ((x + ~51U) >> 8) & 255U;
    unsigned int c = ((x + ~61U) >> 8) & 255U;
    unsigned int d = ~((~(x ^ 62U) + 1U) >> 8) & 255U;
    unsigned int e = ~((~(x ^ 63U) + 1U) >> 8) & 255U;
    unsigned int result = a & (x + 'A');

    result |= ~a & b & (x + ('a' - 26));
    result |= ~b & c & (x + ('0' - 52));
    result |= d & '-';
    result |= e & '_';
    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
