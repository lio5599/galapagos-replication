#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int magnitude;

    a_val ^= 0x55;
    magnitude = ((a_val & 15) << 4) + 264;

    switch ((a_val >> 4) & 7) {
    case 0: magnitude -= 256; break;
    case 1: break;
    case 2: magnitude *= 2; break;
    case 3: magnitude *= 4; break;
    case 4: magnitude *= 8; break;
    case 5: magnitude *= 16; break;
    case 6: magnitude *= 32; break;
    case 7: magnitude *= 64; break;
    }

    return (a_val & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
