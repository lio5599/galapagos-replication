#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count = 16;
    int header_bits = 7 + bps;
    int payload_bits;

    header_bits += 7;
    count += ch * (header_bits / 8);

    if (ch == 2) {
        payload_bits = 2 * bps;
        payload_bits += 1;
    } else {
        payload_bits = ch * bps;
    }

    payload_bits *= blocksize;
    payload_bits += 7;
    count += payload_bits / 8;
    count += 2;

    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
