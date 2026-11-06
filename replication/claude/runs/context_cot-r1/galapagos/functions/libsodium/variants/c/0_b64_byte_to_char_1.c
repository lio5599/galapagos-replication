#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Extract bits 8..15 as (v & 0xFF00) >> 8, which is identical to (v >> 8) & 0xFF.
    // 'a'-26 = 71 and '0'-52 = -4 are applied as unsigned +71 and -4, with the same wraparound.
    // The masks and the OR structure are as in the reference, so the result is equal for all x.
    unsigned int a = ((x - 26U) & 0xFF00U) >> 8;
    unsigned int b = ((x - 52U) & 0xFF00U) >> 8;
    unsigned int c = ((x - 62U) & 0xFF00U) >> 8;
    unsigned int d = (((0U - (x ^ 62U)) & 0xFF00U) >> 8) ^ 0xFFU;
    unsigned int e = (((0U - (x ^ 63U)) & 0xFF00U) >> 8) ^ 0xFFU;
    return (int) ((a & (x + 65U)) | ((a ^ 0xFFU) & b & (x + 71U)) |
                  ((b ^ 0xFFU) & c & (x - 4U)) | (d & 43U) | (e & 47U));
}


int main(){
    b64_byte_to_char(0);
}
