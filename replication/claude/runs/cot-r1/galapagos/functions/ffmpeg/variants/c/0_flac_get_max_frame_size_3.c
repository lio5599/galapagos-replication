#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Approach: switch on channel count, special-casing 2 like the reference.
    // case 2 adds the stereo residual with 2*bps+1 bits per sample pair.
    // default adds ch*bps bits per sample for every other value, negatives included.
    // Common parts are added before and after the switch, as in the reference.
    int count = 16 + ch * ((7 + bps + 7) / 8);
    switch (ch) {
    case 2:
        count += ((2 * bps + 1) * blocksize + 7) / 8;
        break;
    default:
        count += (ch * bps * blocksize + 7) / 8;
        break;
    }
    return count + 2;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
