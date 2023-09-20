export function steps(from: number): number {
  if (!Number.isInteger(from) || from <= 0) {
    throw "Only positive integers are allowed";
  }

  return step(from);
}

function step(current_num: number, current_step = 0): number {
  let next_step = current_step + 1;

  if (current_num == 1) {
    return current_step;
  }

  let next_num = current_num % 2 == 0 ? current_num / 2 : 3 * current_num + 1;

  return step(next_num, next_step);
}
