extern crate ifmt;
use ifmt::iprintln;

fn square_sum_sum_square_difference(n : i32) -> i32 {
    /// This is a naive solution, but still fast
    return (
        (1..=n).map(|x| x.pow(2)).sum::<i32>()
      - (1..=n).sum::<i32>().pow(2)
    ).abs();
}

fn main() {
    let answer = square_sum_sum_square_difference(100);

    iprintln!("the answer is {answer}.");
}