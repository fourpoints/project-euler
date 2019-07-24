/* Note that soltuion >> max(Int32) */

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

let sum64 = (a, b) => Int64.add(a, Int64.of_int(b))

let lsum = (l) => List.fold_left(sum64, 0L, l)

Js.log(primes(2_000_000) |> lsum)