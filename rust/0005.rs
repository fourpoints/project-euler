extern crate ifmt;
use ifmt::iprintln;

fn lcm(n : i32) -> i32 {
    /// This is a naive solution, and takes roughly 5 minutes to complete
    /// It is a proof-of-concept; demonstrating that rust is speedy enough
    ///     to do brute-force computations.
    let mut i : i32 = 1;

    while ! (1..=n).fold(true, |acc, curr| acc && (i % curr == 0)) {
        i += 1;
        if i % 1_000_000 == 0 { iprintln!("{i}")}
    }

    return i;
}

fn main() {
    let answer = lcm(20);

    iprintln!("the answer is {answer}.");
}