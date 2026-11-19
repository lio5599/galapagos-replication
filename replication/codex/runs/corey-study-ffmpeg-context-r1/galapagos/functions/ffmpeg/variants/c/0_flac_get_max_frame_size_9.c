#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count = 16;
    int payload;

    count = count + ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        payload = 2 * bps;
        payload = payload + 1;
        payload = payload * blocksize;
    } else {
        payload = ch * bps;
        payload = payload * blocksize;
    }
    payload = payload + 7;
    payload = payload / 8;
    count = count + payload;
    count = count + 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
