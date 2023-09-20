export function valid(digits: string): boolean {
  let digitsWithoutSpaces = digits.replaceAll(/\s/g, '');
  let nums: number[] = digitsWithoutSpaces.split('').map(Number).filter(Number.isInteger);
  const numsLength = nums.length;

  if (numsLength <= 1 || numsLength != digitsWithoutSpaces.length ) {
    return false
  }

  let offset = numsLength % 2;

  let sum = nums.reduceRight((acc, curr, index) => {
    if ((index + offset) % 2 == 0) {
      let doubled = curr * 2;

      return acc + (doubled > 9 ? doubled - 9 : doubled)
    }

    return acc + curr
  });

  return sum % 10 == 0
}
