#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses ternary operator to select residual byte count based on channel count.
    // The expression for stereo residual is ((2*bps+1)*blocksize+7)/8.
    // For non-stereo, it is (ch*bps*blocksize+7)/8. Header and CRC added directly.
    int count;
    int residual = (ch == 2) ? ((2 * bps + 1) * blocksize + 7) / 8 : (ch * bps * blocksize + 7) / 8;
    count = 16 + ch * ((7 + bps + 7) / 8) + residual + 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
