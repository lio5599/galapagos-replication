#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Expands each payload numerator into the same sequence of signed operations.
    // The shared division still truncates toward zero, including for negative values.
    // Overhead and final additions retain the reference order and defined behavior.
    int count = 16;
    int payload;

    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        payload = 2 * bps;
        payload += 1;
        payload *= blocksize;
        payload += 7;
    } else {
        payload = ch * bps;
        payload *= blocksize;
        payload += 7;
    }
    payload /= 8;
    count += payload;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
