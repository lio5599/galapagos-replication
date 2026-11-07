#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    static const int scale[8] = { 1, 1, 2, 4, 8, 16, 32, 64 };
    int decoded = a_val ^ 0x55;
    int code = decoded & 127;
    int magnitude = ((code & 15) * 16 + (code < 16 ? 8 : 264))
                    * scale[code >> 4];

    return (decoded >> 7) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
