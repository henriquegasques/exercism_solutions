#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq + std::clone::Clone>(first_list: &[T], second_list: &[T]) -> Comparison {
    if first_list == second_list { return Comparison::Equal }

    let first_vec = first_list.to_vec();
    let second_vec = second_list.to_vec();

    for x in first_vec {
    }

    Comparison::Unequal
}
