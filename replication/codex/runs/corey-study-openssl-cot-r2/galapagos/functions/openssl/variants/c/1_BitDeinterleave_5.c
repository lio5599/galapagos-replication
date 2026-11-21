#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Complement each bit twice to recover the reference's unchanged input.
    // The intermediate uint64_t stores exactly the inverted 64-bit pattern.
    // Zero and the maximum value are exchanged temporarily and then restored.
    uint64_t inverted = (uint64_t)~Ai;
    return (uint64_t)~inverted;
}


int main(){
    BitDeinterleave(0);
}
