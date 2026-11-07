#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int u = (unsigned int)c;
    unsigned int x =
        ((255U ^ (((u - 'A') >> 8) & 255U)) &
         (255U ^ ((('Z' - u) >> 8) & 255U)) & (u - 'A')) |
        ((255U ^ (((u - 'a') >> 8) & 255U)) &
         (255U ^ ((('z' - u) >> 8) & 255U)) & (u - ('a' - 26))) |
        ((255U ^ (((u - '0') >> 8) & 255U)) &
         (255U ^ ((('9' - u) >> 8) & 255U)) & (u - ('0' - 52))) |
        ((255U ^ (((0U - (u ^ '+')) >> 8) & 255U)) & 62U) |
        ((255U ^ (((0U - (u ^ '/')) >> 8) & 255U)) & 63U);

    return x ? x : (((0U - (u ^ 'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
