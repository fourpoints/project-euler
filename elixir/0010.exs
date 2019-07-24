# https://rosettacode.org/wiki/Sieve_of_Eratosthenes#Elixir
defmodule PrimeSieveMap do
  @typep sieve_tuple_type :: {integer, integer, integer, Enumerable.integer, %{integer => integer}}

  @spec advance(sieve_tuple_type) :: sieve_tuple_type
  defp advance {last_odd, base_prime, base_square, base_primes?, composites} do
    # last_odd
    # base_prime and base_square are kept to reduce computations
    # base_primes are defined recursively
    # composites keep track of prime multiples (aka composites)

    base_primes = if base_primes? === nil do oddprimes() else base_primes? end

    odd = last_odd + 2
    if odd == base_square do # case 1: odd is the square the base

      step = 2*base_prime # we increment by 2*p because we skip even numbers

      # head : next_base_prime
      # tail : next_base_primes
      next_base_primes = base_primes |> Stream.drop(1)
      next_base_prime = next_base_primes |> Enum.at(0) # next_base_primes is computed anew each time here

      next_base_square = next_base_prime * next_base_prime

      advance {odd, next_base_prime, next_base_square, next_base_primes, composites |> Map.put(odd + step, step)}
    else
        if composites |> Map.has_key?(odd) do # case 2a: odd is a multiple of a prime

          {step, t_composites} = composites |> Map.pop(odd)
          # we keep track of the multiples of primes such that they are close to the current odd number
          # keys are unique, so we must consider that p*q == q*p, so if two sequences intertwine
          # , we simply skip to the next number in the sequence
          [next_composite] =
            Stream.iterate(odd + step, fn(x) -> x + step end)
              |> Stream.drop_while(fn(x) -> Map.has_key?(t_composites, x) end)
              |> Enum.take(1)
          advance {odd, base_prime, base_square, base_primes, Map.put(t_composites, next_composite, step)}

        else # case 2b: odd is the next prime in the sequence
          {odd, base_prime, base_square, base_primes, composites}
        end
    end
  end

  @spec oddprimes() :: Enumerable.integer
  defp oddprimes do
    # to avoid racing, we could pre-seed with more elements
    # adding 5, we would then have to change the initial conditions to {5+2, 5, 5*5, nil %{9=>6}}
    # rewrite [3] -> [3, 5], and write Stream.drop(oddprimes(), 1) in advance/1
    # we would have to populate map because of Stream.drop() ignoring 3.
    #
    # Because advance depends on oddprimes, we must at least provide the first odd prime.
    init = {3+2, 3, 3*3, nil, %{}}
    [3] |> Stream.concat(
      Stream.iterate(init, fn (t) -> advance t end)
        |> Stream.map(&(elem(&1, 0)))
    )
  end

  @spec primes() :: Enumerable.integer
  def primes do
    Stream.concat([2], oddprimes())
  end
end

defmodule Problem10 do
  @n 2_000_000

  def less_than n do
    (fn (x) -> (x <= n) end)
  end

  def solution do
    PrimeSieveMap.primes()
      |> Stream.take_while(less_than(@n))
      |> Enum.sum()
  end


IO.puts "The solution is #{Problem10.solution}"