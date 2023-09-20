#include "word_count.h"
#include "stdio.h"
#include <ctype.h>

int count_words(const char *sentence, word_count_word_t *words) {
    words->text = char sentence;
    words->count += 1;

    return words->count;
}
