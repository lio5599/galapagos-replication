#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Computes max FLAC frame size: header (16) + subframe header (ch*(7+bps+7)/8)
    // + residual data (stereo: (2*bps+1)*blocksize/8 rounded up; mono: ch*bps*blocksize/8 rounded up)
    // + 2 bytes CRC. Uses integer arithmetic with rounding up via (x+7)/8.
    int count;
    count = 16;
    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        count += ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        count += (ch * bps * blocksize + 7) / 8;
    }
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
