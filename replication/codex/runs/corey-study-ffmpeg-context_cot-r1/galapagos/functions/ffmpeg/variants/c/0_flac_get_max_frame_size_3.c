#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses a switch to select precisely the same stereo and default branches.
    // Each calculation retains the original grouping and signed division.
    // The accumulated additions occur in the same order for all defined inputs.
    int count = 16;

    count += ch * ((7 + bps + 7) / 8);
    switch (ch) {
    case 2:
        count += ((2 * bps + 1) * blocksize + 7) / 8;
        break;
    default:
        count += (ch * bps * blocksize + 7) / 8;
        break;
    }
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
