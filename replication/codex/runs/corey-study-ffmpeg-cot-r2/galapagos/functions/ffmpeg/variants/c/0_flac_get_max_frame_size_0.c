#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Computes the reference frame-size bound from header, sample, and CRC bytes.
    // A conditional expression selects the same stereo or general payload.
    // Signed division and addition order are unchanged, including zero or negatives.
    int count = 16;
    count += ch * ((7 + bps + 7) / 8);
    count += (ch == 2)
        ? ((2 * bps + 1) * blocksize + 7) / 8
        : (ch * bps * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
