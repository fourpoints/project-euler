extern crate ifmt;
use ifmt::iprintln;


fn nth_prime(n : i32) -> i32 {
    /// the upper bound for the nth prime is due to Pierre Dusart
    /// this bound is not tight, ~10x more than actual
    /// tighter bounds can be found depending on the size of n

    let f = n as f32;
    let u = (f * (f.ln() + f.ln().powf(2.0))).ceil() as usize;

    iprintln!("upper bound: {u}");


    let mut sieve : Vec<bool> = vec![true; u+1];

    sieve[0] = false;
    sieve[1] = false;

    for i in 2..=u {
        if !sieve[i] { continue; }

        for x in (i.pow(2)..=u).step_by(i) {
            sieve[x] = false;
        }
    }

    return sieve.iter()
        .enumerate()
        .filter(|(_, value)| **value)
        .map(|(index, _)| index as i32)
        .skip(n as usize - 1)
        .next().unwrap();
}

fn main() {
    let answer = nth_prime(10001);

    iprintln!("the answer is {answer}.");
}