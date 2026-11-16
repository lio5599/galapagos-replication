#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = x < 26;
    unsigned int b = x < 52;
    unsigned int c = x < 62;
    unsigned int d = x == 62;
    unsigned int e = x == 63;
    
    unsigned int val_a = 'A' + x;
    unsigned int val_b = 'a' + x - 26;
    unsigned int val_c = '0' + x - 52;
    unsigned int val_d = '+';
    unsigned int val_e = '/';
    
    return (a & val_a) | ((!a) & b & val_b) | ((!b) & c & val_c) | ((!c) & d & val_d) | ((!d) & e & val_e);
}


int main(){
    b64_byte_to_char(0);
}
