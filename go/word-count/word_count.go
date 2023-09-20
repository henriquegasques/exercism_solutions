package wordcount

import (
	"regexp"
	"strings"
)

type Frequency map[string]int

var nonAlphanumericRegex = regexp.MustCompile(`[^a-zA-Z0-9']+`)

func WordCount(phrase string) Frequency {
	phrase = strings.Trim(phrase, "'")
	phrase = nonAlphanumericRegex.ReplaceAllString(phrase, " ")
	phrase = strings.ToLower(phrase)

	words := strings.Fields(phrase)
	freqMap := make(Frequency)

	for _, word := range words {
		freqMap[strings.Trim(word, "'")] += 1
	}

	return freqMap
}
