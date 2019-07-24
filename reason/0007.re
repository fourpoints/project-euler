let primes = (n) => {
  let sieve = Array.make(n+1, 1)
  sieve[0] = 0
  sieve[1] = 0

  for (i in 0 to n) {
    if (sieve[i] == 1) {
      sieve[i] = i
      for (j in 2 to n/i) {
        sieve[i*j] = 0
      }
    }
  }

  sieve |> Array.to_list |> List.filter(x => x != 0)
}

let prime_upper_bound = (p) => {
  let f = float_of_int(p);
  ceil((f *. (log(f) +. log(f)**2.0))) |> int_of_float
}

/* 1-indexing, because nth is an ordinal */
let nth = (l, n) => List.nth(l, n-1)

let n = 10_001

Js.log(primes(upper_bound(n)) -> nth(n))