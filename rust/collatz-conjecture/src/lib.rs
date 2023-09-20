pub fn collatz(n: u64) -> Option<u64> {
    if n == 1 { return Some(0) };

    let mut current = n;
    let mut steps = 0;

    loop {
        match step(current) {
            Some(0) => return None,
            Some(1) => return Some(steps + 1),
            Some(number) => {
                steps += 1;
                current = number;
                continue;
            }
            None => return None
        }
    }
}

fn step(n: u64) -> Option<u64> {
    if n == 1 { return Some(n) }

    if n % 2 == 0 { Some(n / 2) } else { Some(n.checked_mul(3)?.checked_add(1)?) }
}
