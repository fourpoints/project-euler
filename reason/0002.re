/* https://blog.smartlogic.io/reasonable-development/ */
/*unused*/
type _memo = Hashtbl.t(int, int)

let rec f = (~n, ~memo as m) => {
  switch n {
    | 0 => 0
    | 1 => 1
    | x => {
      if (! Hashtbl.mem(m, n)) {
        Hashtbl.add(m, n, f(~n=x-1, ~memo=m) + f(~n=x-2, ~memo=m))
      }
      Hashtbl.find(m, n)
    }
  }
}

/*unused*/
let _fib = (n) => f(~n, ~memo=Hashtbl.create(~random=true, 0))

let tolist = (_key, value, acc) => [value, ...acc]
let listify_hashtbl = (h) => Hashtbl.fold(tolist, h, [])

let get_fibs_up_to = (upper_bound) => {
  /* local fibonacci hashtbl */
  let fibs = Hashtbl.create(~random=true, 1000)
  let fib = (n) => f(~n, ~memo=fibs)


  /* fill hashtbl with fib-values up to upper_bound */
  let i = ref(0)
  while (fib(i^) <= upper_bound) { i := i^ + 1 }

  /* return values in hashtbl as list */
  fibs |> listify_hashtbl
}


let is_even = (n) => n mod 2 == 0
let sum = (current, acc) => current + acc

let sum_list = (l) => List.fold_left(sum, 0, l)
let filter_list = (p) => (l) => List.filter(p, l)


let fibs = get_fibs_up_to(4_000_000)

Js.log(fibs |> filter_list(is_even) |> sum_list)