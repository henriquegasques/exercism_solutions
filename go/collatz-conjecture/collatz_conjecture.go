package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	if n <= 0 {
		return 0, errors.New("Input needs to be positive")
	}

	return runStep(n, 0), nil
}

func runStep(n int, steps int) int {
	if n == 1 {
		return steps
	}

    var newVal int
    if n%2 == 0 {
        newVal = n / 2
	} else {
        newVal = n * 3 + 1
	}

    steps++

    return runStep(newVal, steps)
}
