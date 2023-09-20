pub fn find(array: &[i32], key: i32) -> Option<usize> {
    if array.len() <= 0 { return None }

    let mut low = 0;
    let mut high = array.len() - 1;

    while low <= high {
        if low == high {
            return if array[low] == key { Some(low) } else { None }
        }

        let mid = (high - low) / 2 + low;
        let guess = array[mid];

        if guess == key { return Some(mid) }

        if guess < key { low = mid + 1 } else { high = mid }
    }

    return None
}
