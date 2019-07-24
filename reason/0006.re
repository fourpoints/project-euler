let rec (--) = (a, b) => (a > b) ? [] : [a, ...(a + 1 -- b)]

let square = (n) => n*n
let lsquare = List.map(square)

let sum = (x) => List.fold_left((+), 0, x)

let squaresum = (l) => (l |> sum |> square)
let sumsquare = (l) => (l |> lsquare |> sum)

let func_diff = (f, g, x) => (x |> f) - (x |> g)

Js.log((1--100) |> func_diff(squaresum, sumsquare))