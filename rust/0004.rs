extern crate ifmt;
use ifmt::iprintln;

pub trait ReverseDigits  {
    fn reverse_digits(&self) -> Self where Self: Sized;
}

impl ReverseDigits for u32 {
    fn reverse_digits(&self) -> Self {
        self.to_string()
            .chars()
            .rev()
            .collect::<String>()
            .parse()
            .unwrap()
    }
}

fn palindrome(digits : u32) -> u32 {
    let bottom : u32 = 10_u32.pow(digits-1);
    let top : u32 = 10_u32.pow(digits);

    let mut largest_palindrome : u32 = 0;

    for i in (bottom..top).rev() {
        for j in (i..top).rev() {
            let prod = i*j;

            if prod == prod.reverse_digits() {
                if prod > largest_palindrome {
                    iprintln!("{i}, {j}");
                    largest_palindrome = prod;
                }
            }
        }
    }

    return largest_palindrome;
}

fn main() {
    let answer = palindrome(3);

    iprintln!("the answer is {answer}.");
}