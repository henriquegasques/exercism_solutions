#include "grains.h"

uint64_t square(uint8_t index) {
  if (index <= 1) {
    return index;
  }

  // I know there's a way to do this without iteration by using bitwise operations
  // or something, but I don't want to just look that up.
  uint64_t result = 1;
  for (int i = 1; i < index; i++) {
    result *= 2;
  }

  return result;
}

uint64_t total(void) {
  return 2 * square(64)-1;
}
