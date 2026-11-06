#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // A single expression that uses a ternary to choose the bits per sample frame.
    // The additions still run left to right: 16, header, payload, 2, as in the reference.
    // bps+14 overflows exactly when 7+bps+7 does, and the result is the same otherwise.
    // Signed division truncates toward zero, as the reference does.
    return 16 + ch * ((bps + 14) / 8)
           + (((ch == 2) ? (2 * bps + 1) : (ch * bps)) * blocksize + 7) / 8
           + 2;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
