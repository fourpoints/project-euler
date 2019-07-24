extern crate ifmt;
use ifmt::iprintln;


fn triplet(n : i32) -> Option<i32> {
    for a in 1..n {
        for b in 1..a {
            // a + b + c = 1000 => c = 1000 - (a + b)
            let c = n - (a + b);

            if a.pow(2) + b.pow(2) == c.pow(2) {
                return Some(a*b*c)
            }
        }
    }

    return None;
}

fn main() {
    let answer = triplet(1000).unwrap();

    iprintln!("the answer is {answer}.");
}