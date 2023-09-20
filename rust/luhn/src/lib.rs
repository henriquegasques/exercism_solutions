/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let digit_chars: Vec<char> = code.replace(" ", "").chars().collect();

    if digit_chars.len() <= 1 { return false }
    if !digit_chars.iter().all(|chr| chr.is_digit(10)) { return false };

    digit_chars.iter().rev().enumerate()
        .filter_map(|(i, n)| {
            let digit = n.to_digit(10).unwrap();

            if i != 0 && i % 2 != 0 {
                let doubled = digit * 2;
                if doubled > 9 { Some(doubled - 9) } else { Some(doubled) }
            } else {
                Some(digit)
            }
        }).sum::<u32>() % 10 == 0
}
