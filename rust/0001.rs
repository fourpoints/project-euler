extern crate ifmt;
use ifmt::iprintln;

fn summing(end : i32, divisors : &[i32]) -> i32 {
    let divisible = |x| divisors.iter().any(|&y : &i32| -> bool {x % y == 0});

    // last expression is returned by default
    (1..=end).filter(|&z : &i32| -> bool {divisible(z)}).sum()
}

fn main() {
    let end : i32 = 1000;
    let divisors : [i32; 2] = [3, 5];

    let answer : i32 = summing(end, &divisors);

    iprintln!("The answer is {answer}.")
}