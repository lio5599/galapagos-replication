#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Accumulate the original terms using OR expressed as XOR plus intersection.
    // The identity handles overlapping partial masks, so it also preserves out-of-range behavior.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int result = a & (x + 'A');
    unsigned int term = (a ^ 255U) & b & (x + ('a' - 26));
    result = (result ^ term) ^ (result & term);
    term = (b ^ 255U) & c & (x + ('0' - 52));
    result = (result ^ term) ^ (result & term);
    term = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '-';
    result = (result ^ term) ^ (result & term);
    term = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '_';
    return (result ^ term) ^ (result & term);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
