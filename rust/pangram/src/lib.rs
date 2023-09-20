/// Determine whether a sentence is a pangram.
pub fn is_pangram(sentence: &str) -> bool {
    let normalized_sentence = sentence.to_ascii_lowercase();

    ('a'..='z').all(|letter| normalized_sentence.contains(letter))
}
