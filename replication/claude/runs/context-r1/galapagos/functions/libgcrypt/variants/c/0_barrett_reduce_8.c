#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  int32_t rounded = (int32_t)a * 20159 + (1 << 25);
  int32_t remainder = rounded & 0x03FFFFFF;
  int32_t quotient = (rounded - remainder) / (1 << 26);
  return (int16_t)((int32_t)a - quotient * 3329);
}


int main(){
    barrett_reduce(0);
}
