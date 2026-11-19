#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Separates the branch-dependent bit rate from the common payload calculation.
    // The rate is exactly the left operand of the original blocksize multiplication.
    // Multiplication, rounding adjustment, and signed division keep their original order.
    int count = 16;
    int rate;

    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        rate = 2 * bps + 1;
    } else {
        rate = ch * bps;
    }
    count += (rate * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
