#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Computes frame size by separating stereo and non-stereo cases early.
    // For ch==2: residual uses (2*bps+1)*blocksize. For ch!=2: uses ch*bps*blocksize.
    // Both use ceiling division by 8. Header and CRC are constant offsets.
    int count;
    int residual;
    if (ch == 2) {
        residual = ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        residual = (ch * bps * blocksize + 7) / 8;
    }
    count = 16 + ch * ((bps + 14) / 8) + residual + 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
