#include "sum_of_multiples.h"
#include <stdio.h>

unsigned int sum(const unsigned int *factors,
                 const size_t number_of_factors,
                 const unsigned int limit) {

    unsigned int count = 0;

    for (size_t i = 1; i < limit; i++) {
        for (size_t f = 0; f < number_of_factors; f++) {
            if (factors[f] != 0 && i % factors[f] == 0) {
                count += i;
                break;
            }
        }
    }

    return count;
}
