/* Int32 solution */
let rec (--) = (a, b) => (a > b) ? [] : [a, ...(a + 1 -- b)]

let rec gcd = (a, b) => (b > 0) ? gcd(b, a mod b) : a

let lcm= (a, b) => abs(a*b) / gcd(a, b)

let lcm_seq = (it) => List.fold_right(lcm, it, 1)

Js.log(lcm_seq(1--10))

/* Int64 solution */
let rec (---) = (a, b) => (a > b) ? [] : [Int64.of_int(a), ...(a + 1 --- b)]

let rec gcd64 = (a, b) => (b > 0L) ? gcd64(b, Int64.rem(a, b)) : a

let lcm64 = (a, b) => (Int64.rem(a, b) == 0L) ?
	a : Int64.div(Int64.abs(Int64.mul(a, b)), gcd64(a, b))

let lcm64_seq = (it) => List.fold_left(lcm64, 1L, it)

Js.log(lcm64_seq(1---20))