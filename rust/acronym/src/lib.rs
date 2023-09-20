pub fn abbreviate(phrase: &str) -> String {
    if phrase.is_empty() { return "".to_string() };

    let words = phrase.split_whitespace();
    let mut acronym = String::new();

    for word in words {
        if !word.chars().all(char::is_uppercase) {
            acronym += &word.chars().next().unwrap().to_uppercase().to_string();
        }

        acronym += word.chars()
    }

    return acronym.to_uppercase();
}
