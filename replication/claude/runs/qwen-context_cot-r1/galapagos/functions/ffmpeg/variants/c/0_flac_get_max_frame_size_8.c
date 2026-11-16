#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Alternative structure: compute residual first, then add fixed components.
    // The fixed components are 16 (header) + 2 (CRC) + subframe header.
    // Subframe header is ch * ceil((bps+14)/8).
    int residual;
    if (ch == 2) {
        residual = ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        residual = (ch * bps * blocksize + 7) / 8;
    }
    int fixed = 18 + ch * ((bps + 14) / 8);
    return fixed + residual;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
