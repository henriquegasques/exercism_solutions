#include "luhn.h"
#include "stdio.h"
#include <string.h>
#include <ctype.h>

bool luhn(const char *num) {
    unsigned short int length = strlen(num);
    unsigned short int sum = 0;

    if (length <= 1) return false;

    int shouldDoubleNextDigit = false;

    for (int i = 1; i <= length; i++) {
        char currentChar = num[length-i];

        if (isdigit(currentChar)) {
            int digit = currentChar - 48;

            if (shouldDoubleNextDigit)
                digit = digit >= 5 ? digit * 2 - 9 : digit * 2;

            shouldDoubleNextDigit = !shouldDoubleNextDigit;
            sum += digit;
        } else if (isspace(currentChar)) {
            if (i == 1 || i == length) return false; // Cannot start or end with spaces (ok not really but works..)
        } else {
            return false; // Non-digit, non-space char is not allowed
        }
    }

    return sum % 10 == 0;
}
