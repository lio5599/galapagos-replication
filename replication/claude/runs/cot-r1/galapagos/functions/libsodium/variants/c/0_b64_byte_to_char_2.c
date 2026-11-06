#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Approach: for unsigned values, v >> 8 equals v / 256 and v & 0xFF equals v % 256.
    // The complement of a byte m, which is m ^ 0xFF, equals 255 - m because m <= 255.
    // The masks are therefore the same as in the reference, and the combination is unchanged.
    // So the result matches for all unsigned x, including wrapped subtractions and x >= 64.
    unsigned int a = (x - 26U) / 256U % 256U;
    unsigned int b = (x - 52U) / 256U % 256U;
    unsigned int c = (x - 62U) / 256U % 256U;
    unsigned int d = 255U - (0U - (x ^ 62U)) / 256U % 256U;
    unsigned int e = 255U - (0U - (x ^ 63U)) / 256U % 256U;
    return (int) ((a & (x + 65U)) | ((255U - a) & b & (x + 71U)) |
                  ((255U - b) & c & (x - 4U)) | (d & 43U) | (e & 47U));
}


int main(){
    b64_byte_to_char(0);
}
