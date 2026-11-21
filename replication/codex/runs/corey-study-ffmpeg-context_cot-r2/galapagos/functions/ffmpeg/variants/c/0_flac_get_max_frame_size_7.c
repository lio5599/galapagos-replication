#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Selects the bits-per-sample factor before the common blocksize multiplication.
    // These factors are exactly the original expressions before that multiplication.
    // Multiplication grouping, rounding addition, and signed division are preserved.
    int count = 16;
    int factor;

    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        factor = 2 * bps + 1;
    } else {
        factor = ch * bps;
    }
    count += (factor * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
