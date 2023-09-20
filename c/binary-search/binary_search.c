#include "binary_search.h"
#include "math.h"

const int *binary_search(int value, const int *arr, size_t length) {
    if (!length)
        return NULL;

    if (length == 2) {
        if (arr[0] == value) {
            return &arr[0];
        } else if (arr[1] == value) {
            return &arr[1];
        } else {
            return NULL;
        }
    }

    return search(value, arr, 0, length-1);
}

const int *search(int value, const int *arr, size_t start, size_t end) {
    if (start == end) {
        return arr[start] == value ? &arr[start] : NULL;
    }

    size_t middle = floor((start + end)/ 2);

    if (arr[middle] == value) {
        return &arr[middle];
    } else if (value < arr[middle]) {
        return search(value, arr, start, middle-1);
    } else {
        return search(value, arr, middle+1, end);
    }
}
