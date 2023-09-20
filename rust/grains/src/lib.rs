pub fn square(s: u32) -> u64 {
    if !(1..65).contains(&s) { panic!("Square must be between 1 and 64") }

    if s == 1 { return s as u64 }

    let first_square: u64 = 1;
    let desired_square: u64 = s as u64;
    let board_squares = first_square..desired_square+1;

    board_squares.reduce(|acc, n| if n == 1 { n } else { acc * 2 }).unwrap()
}

pub fn total() -> u64 {
    u64::MAX
}
