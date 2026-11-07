#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Use an XOR-based bit selector for the uppercase and lowercase terms.
    // Selecting upper under a and lower otherwise equals their original masked OR.
    // The selector works per bit, so partial masks and all unsigned inputs are valid.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int lower = b & (x + ('a' - 26));
    unsigned int result = lower ^ (a & ((x + 'A') ^ lower));
    unsigned int dash = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int underscore = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;

    result |= (b ^ 255U) & c & (x + ('0' - 52));
    result |= dash & '-';
    result |= underscore & '_';

    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
