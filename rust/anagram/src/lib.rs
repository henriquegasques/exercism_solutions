use std::collections::HashSet;

struct Anagram {
    value: String
}

impl Anagram {
    fn new(value: &str) -> Self {
      Self { value: value.to_string() }
    }

    fn sorted_chars(&self) -> Vec<char> {
        let mut chars = self.chars();
        chars.sort();
        chars
    }

    fn chars(&self) -> Vec<char> {
        self.value.to_lowercase().chars().collect()
    }
}

impl PartialEq for Anagram {
    fn eq(&self, other: &Self) -> bool {
        self.chars() != other.chars() && self.sorted_chars() == other.sorted_chars()
    }
}

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let input = Anagram::new(word);

    possible_anagrams.iter().cloned().filter(|item| Anagram::new(item) == input ).collect()
}
