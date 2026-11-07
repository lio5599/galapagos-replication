#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Maps 0 through 63 to URL-safe Base64 characters; other inputs follow the reference's byte masks.
    // Naming the five masks leaves every unsigned subtraction and bitwise operation unchanged.
    // Thus wraparound and inputs outside the Base64 range retain their original behavior.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;

    return (int)((a & (x + 'A')) |
                 ((a ^ 255U) & b & (x + ('a' - 26))) |
                 ((b ^ 255U) & c & (x + ('0' - 52))) |
                 (d & '-') |
                 (e & '_'));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
