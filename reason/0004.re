/* fast exponentiation algorithm */
/* overwrite ** for integers */
let rec (**) = (a, n) =>
	switch(n) {
      | 0 => 1
      | 1 => a
      | n => a**(n/2) * a**(n/2) * (n mod 2 == 0 ? 1 : a)
	}

/* integer logarithm */
let ilog10 = (n) => int_of_float(log10(float_of_int(n)))

let rec reverse_digits = (a) =>
	(a == 0) ? 0 : (a mod 10)*10**ilog10(a) + reverse_digits(a/10)

let is_palindrome = (a) => a == reverse_digits(a)

let m = ref(0)
for (i in 100 to 999) {
  for (j in 100 to 999) {
    let prod = i*j
	if (prod |> is_palindrome) { m := max(m^, prod) }
  }
}

Js.log(m)