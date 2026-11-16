#include <stdint.h>

__attribute__((noinline))
int fpr_lt_10(uint64_t x, uint64_t y) {
    // Final implementation using explicit case analysis for clarity
    // Case 1: x negative, y positive -> x < y is true
    // Case 2: x positive, y negative -> x < y is false  
    // Case 3: both positive -> compare as signed integers
    // Case 4: both negative -> compare reversed as signed integers
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    int x_neg = (x >> 63) & 1;
    int y_neg = (y >> 63) & 1;

    if (x_neg && !y_neg) return 1;
    if (!x_neg && y_neg) return 0;
    if (x_neg) return (int)(sy < sx);
    return (int)(sx < sy);
}


int main(){
    fpr_lt_10(0,0);
}
