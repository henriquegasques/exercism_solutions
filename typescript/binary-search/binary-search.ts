export function find(haystack: number[], needle: number): number | never {
    const search = (start = 0, end = haystack.length): number => {
        let haystackSlice = haystack.slice(start, end);

        if (!haystackSlice.length) throw new Error('Value not in array');

        let middle = Math.floor((start + end) / 2);
        let currentNumber = haystack[middle];

        if (currentNumber == needle) return middle;

        needle < currentNumber ? end = middle : start = (middle + 1);

        return search(start, end);
    }

    return search()
}
