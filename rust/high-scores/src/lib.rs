#[derive(Debug)]
pub struct HighScores<'a> {
    scores : &'a [u32]
}

impl<'a> HighScores<'a> {
    pub fn new(scores: &'a[u32]) -> Self {
        HighScores { scores }
    }

    pub fn scores(&self) -> &[u32] {
        self.scores
    }

    pub fn latest(&self) -> Option<u32> {
        Some(*self.scores.last()?)
    }

    pub fn personal_best(&self) -> Option<u32> {
        Some(*self.scores.iter().reduce(|acc, score| {
            score.max(acc)
       })?)
    }

    pub fn personal_top_three(&self) -> Vec<u32> {
        let mut scores = self.scores.to_owned();

        scores.sort();
        scores.reverse();

        if scores.len() >= 3 {
            scores.get(0..3).unwrap().to_vec()
        } else {
            scores
        }
    }
}
