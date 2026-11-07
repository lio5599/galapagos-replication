#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Accumulate the five masked contributions separately.
    // OR is associative, so this preserves the reference even when masks overlap.
    // All mask calculations retain unsigned wraparound for out-of-range inputs.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int result = a & (x + 'A');

    result |= (255U ^ a) & b & (x + ('a' - 26));
    result |= (255U ^ b) & c & (x + ('0' - 52));
    result |= (255U ^ (((0U - (x ^ 62U)) >> 8) & 255U)) & '-';
    result |= (255U ^ (((0U - (x ^ 63U)) >> 8) & 255U)) & '_';
    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
