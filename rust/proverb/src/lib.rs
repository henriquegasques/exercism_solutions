pub fn build_proverb(list: &[&str]) -> String {
    if list.len() > 0 {
        let first = list.first().unwrap();
        let windows = list.windows(2);

        let result: String = windows.map(|pair| {
            format!("For want of a {} the {} was lost.\n", &pair[0], &pair[1])
        }).collect();

        result + &format!("And all for the want of a {}.", first)
    } else { String::new() }
}
