let N = 600_851_475_143L

/* largest prime factor ; 32bit version */
let rec lpf = (~i=2, n) =>
    (i*i > n) ? n : (n mod i == 0) ? lpf(~i=i, n/i) : lpf(~i=i+1, n)

/* operators only work for Int32, so we must use Int64 functions instead*/
let rec lpf64 = (~i=2L, n) =>
    (Int64.mul(i, i) > n)
		? n
		: (Int64.rem(n, i) == 0L)
			? lpf(~i=i, Int64.div(n, i))
			: lpf(~i=Int64.add(i, 1L), n)

Js.log(lpf64(N))