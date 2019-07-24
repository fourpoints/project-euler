extern crate ifmt;
use ifmt::iprintln;


fn primesieve(u : usize) -> Vec<i64> {
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
        .map(|(index, _)| index as i64)
        .collect();
}

fn primesum(n : i32) -> i64 {

    let primesieve = primesieve(n as usize);

    return primesieve.iter().sum::<i64>();
}

fn main() {
    let answer = primesum(2_000_000);

    iprintln!("the answer is {answer}.");
}