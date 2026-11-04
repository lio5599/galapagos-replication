#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z, w, s;
    uint32_t t, d;

    z = (uint64_t)a * (uint64_t)b;
    w = (uint64_t)((uint32_t)(z * p0i) & 0x7FFFFFFFu) * (uint64_t)p;
    s = z + w;
    t = (uint32_t)(s >> 31);
    d = t - p;
    d += p & (uint32_t)(0u - (d >> 31));
    return d;
}


int main(){
    modp_montymul(0,0,0,0);
}
