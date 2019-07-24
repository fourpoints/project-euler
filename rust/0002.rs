extern crate ifmt;
use ifmt::iprintln;

struct Fibonacci {
    curr: u32,
    next: u32,
}

impl Iterator for Fibonacci {
    // type of elements in the iterator
    type Item = u32;

    fn next(&mut self) -> Option<u32> {
        let tmp = self.curr;

        self.curr = self.next;
        self.next += tmp;

        Some(tmp)
    }
}


// Returns a Fibonacci sequence generator
fn fibonacci() -> Fibonacci {
    Fibonacci { curr: 1, next: 1 }
}

fn main() {
    let answer : u32 = fibonacci()
        .take_while(|&x| x < 4_000_000)
        .filter(|&x| x % 2 == 0)
        .sum();

    iprintln!("the answer is {answer}.");
}