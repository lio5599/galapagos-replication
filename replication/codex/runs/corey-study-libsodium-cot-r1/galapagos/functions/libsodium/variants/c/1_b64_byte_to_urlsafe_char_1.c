#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Extract each byte using division and remainder instead of shifts.
    // Subtractions wrap in unsigned int before extraction, as in the reference.
    // Subtracting a byte from 255 complements it, including partial masks.
    unsigned int a = x - 26U;
    unsigned int b = x - 52U;
    unsigned int c = x - 62U;
    unsigned int d = 0U - (x ^ 62U);
    unsigned int e = 0U - (x ^ 63U);

    a = (a / 256U) % 256U;
    b = (b / 256U) % 256U;
    c = (c / 256U) % 256U;
    d = 255U - (d / 256U) % 256U;
    e = 255U - (e / 256U) % 256U;

    return (int)((a & (x + 'A')) |
                 ((255U - a) & b & (x + ('a' - 26))) |
                 ((255U - b) & c & (x + ('0' - 52))) |
                 (d & '-') | (e & '_'));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
