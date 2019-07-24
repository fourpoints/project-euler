extern crate ifmt;
use ifmt::iprintln;

//https://docs.rs/integer-sqrt/0.1.2/src/integer_sqrt/lib.rs.html#1-185
pub trait IntegerSquareRoot {
    fn integer_sqrt(&self) -> Self where Self: Sized {
        self.integer_sqrt_checked().expect("cannot calculate square root of negative number")
    }
    fn integer_sqrt_checked(&self) -> Option<Self> where Self: Sized;
}

impl IntegerSquareRoot for i64 {
    #[allow(unused_comparisons)]
    fn integer_sqrt_checked(&self) -> Option<Self> {
        // Hopefully this will be stripped for unsigned numbers (impossible condition)
        if *self < 0 {
            return None
        }
        // Find greatest shift
        let mut shift = 2;
        let mut n_shifted = *self >> shift;
        // We check for n_shifted being self, since some implementations of logical
        // right shifting shift modulo the word size.
        while n_shifted != 0 && n_shifted != *self {
            shift = shift + 2;
            n_shifted = self.wrapping_shr(shift);
        }
        shift = shift - 2;

        // Find digits of result.
        let mut result = 0;
        loop {
            result = result << 1;
            let candidate_result = result + 1;
            if candidate_result * candidate_result <= *self >> shift {
                result = candidate_result;
            }
            if shift == 0 {
                break;
            }
            shift = shift.saturating_sub(2);
        }

        Some(result)
    }
}

fn get_primes(n : usize) -> Vec<i64> {
    let mut sieve : Vec<bool> = vec![true; n+1];

    sieve[0] = false;
    sieve[1] = false;

    for i in 2..n+1 {
        if !sieve[i] { continue; }

        for x in (i.pow(2)..n+1).step_by(i) {
            sieve[x] = false;
        }
    }

    let primes: Vec<i64> = sieve.iter()
        .enumerate()
        .filter(|&(_, &value)| value)
        .map(|(index, _)| index as i64)
        .collect();

    primes
}

fn largest_prime_factor(number : i64) -> i64 {
    let isqrt : usize = number.integer_sqrt() as usize;

    let primes : Vec<i64> = get_primes(isqrt);

    let mut largest_indivisible = number;
    let mut largest_divisor = 1;

    for p in primes {
        while largest_indivisible % p == 0 {
            largest_indivisible /= p;
            largest_divisor = p;
        }
    }

    return if largest_indivisible > 1 { largest_indivisible } else { largest_divisor };
}

fn main() {
    let composite : i64 = 600_851_475_143;

    let answer : i64 = largest_prime_factor(composite);

    iprintln!("the answer is {answer}.");
}