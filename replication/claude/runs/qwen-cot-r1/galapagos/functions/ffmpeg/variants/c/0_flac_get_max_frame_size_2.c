#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses a helper variable for the residual byte count to avoid repetition.
    // For stereo, residual bits are (2*bps+1)*blocksize; otherwise ch*bps*blocksize.
    // Ceiling division by 8 is done via (bits+7)/8. Header and CRC added separately.
    int count;
    int residual_bytes;
    if (ch == 2) {
        residual_bytes = ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        residual_bytes = (ch * bps * blocksize + 7) / 8;
    }
    count = 16 + ch * ((7 + bps + 7) / 8) + residual_bytes + 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
