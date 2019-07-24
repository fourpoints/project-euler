
/* rec = recursive function */
let rec (--) = (a, b) => (a > b) ? [] : [a, ...(a + 1 -- b)]
/*let rec (--) = (a, b) => (a > b) ? [] : [a] @ (a + 1 -- b)*/

/* probably does not short-circuit */
let any = (x) => List.fold_left((||), false, x)

/* computes n % i == 0 for ever n in the list */
let (%%) = (i, l) => List.map(n => i mod n == 0, l)

let filter_multiples_of = nums => iter => List.filter(i => any(i %% nums), iter)

let sum = (x) => List.fold_left((+), 0, x)

Js.log(1--1000 |> filter_multiples_of([3, 5]) |> sum)