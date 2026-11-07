#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Truncate the candidate character values before applying the reference masks.
    // Every reference term already has an eight-bit mask, so higher bits cannot matter.
    // Unsigned subtraction and addition retain their original wraparound for every x.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    unsigned int upper = (x + 'A') & 255U;
    unsigned int lower = (x + ('a' - 26)) & 255U;
    unsigned int digit = (x + ('0' - 52)) & 255U;
    return (int)((a & upper) | (~a & b & lower) |
                 (~b & c & digit) | (d & '-') | (e & '_'));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
